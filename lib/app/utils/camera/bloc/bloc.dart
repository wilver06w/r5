import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart' as bloc;
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as pat;
import 'package:path_provider/path_provider.dart';
import 'package:r5/app/utils/verifik_ui.dart';

part 'event.dart';
part 'state.dart';

class BlocCamera extends bloc.Bloc<EventCamera, BlocCameraState> {
  BlocCamera() : super(const InitialState(Model())) {
    on<LoadEvent>(_onLoadEvent);
    on<CaptureImageEvent>(_onImageCapturedEvent);
    on<PickFileFromGalleryEvent>(_onPickFileFromGalleryEvent);
    on<ProcessImageEvent>(_onImageProcessingEvent);
    on<ClearCaptureEvent>(_onClearCaptureEvent);
  }

  @override
  Future<void> close() {
    state.model.cameraController?.dispose();
    return super.close();
  }

  Future<void> _onLoadEvent(
    LoadEvent event,
    Emitter<BlocCameraState> emit,
  ) async {
    try {
      emit(LoadingState(state.model));
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        final camera = cameras.firstWhere(
          (element) => element.lensDirection == CameraLensDirection.back,
          orElse: () => cameras.first,
        );
        final controller = CameraController(camera, ResolutionPreset.veryHigh);
        await controller.initialize();
        emit(
          ReadyToCaptureState(
            state.model.copyWith(
              cameraController: controller,
            ),
          ),
        );
      } else {
        emit(
          ErrorState(
            state.model,
            error: CameraException(
              VerifikUiValues.noCameraAvailable,
              VerifikUiValues.deviceNotHaveCamera,
            ),
          ),
        );
      }
    } on CameraException catch (error) {
      emit(
        ErrorState(
          state.model,
          error: error,
        ),
      );
    }
  }

  Future<void> _onImageCapturedEvent(
    CaptureImageEvent event,
    Emitter<BlocCameraState> emit,
  ) async {
    try {
      emit(LoadingState(state.model));

      if (kIsWeb) {
        final capturedFile = await state.model.cameraController?.takePicture();

        if (capturedFile != null) {
          final capture = await capturedFile.readAsBytes();
          final route = File.fromRawPath(capture);
          emit(
            PictureCapturedState(
              state.model.copyWith(
                selfieImagePath: route.path,
                selfieImageMemory: capture,
              ),
            ),
          );
        } else {
          emit(ReadyToCaptureState(state.model));
        }
      } else {
        final capturedFile = await state.model.cameraController?.takePicture();

        if (capturedFile != null) {
          final maxSize = event.maxFileSizeBytes;
          final file = File(capturedFile.path);
          final fileSize = file.lengthSync();
          if (!event.shouldProcessImage || fileSize <= maxSize) {
            emit(
              PictureCapturedState(
                state.model.copyWith(
                  selfieImagePath: file.path,
                ),
              ),
            );
          } else {
            add(
              ProcessImageEvent(
                file: file,
                ratio: (fileSize / maxSize).ceilToDouble(),
              ),
            );
          }
        } else {
          emit(ReadyToCaptureState(state.model));
        }
      }
    } on CameraException catch (error) {
      emit(
        ErrorState(
          state.model,
          error: error,
        ),
      );
    }
  }

  void _onPickFileFromGalleryEvent(
    PickFileFromGalleryEvent event,
    Emitter<BlocCameraState> emit,
  ) async {
    try {
      emit(LoadingState(state.model));

      if (kIsWeb) {
        final pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );
        if (pickedFile != null) {
          final picked = await pickedFile.readAsBytes();
          final route = File.fromRawPath(picked);
          emit(
            PictureCapturedState(
              state.model.copyWith(
                imagePath: route.path,
                imageMemory: picked,
              ),
            ),
          );
        } else {
          emit(ReadyToCaptureState(state.model));
        }
      } else {
        final pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery,
        );
        if (pickedFile != null) {
          final maxSize = event.maxFileSizeBytes;
          final file = File(pickedFile.path);
          final fileSize = file.lengthSync();
          if (!event.shouldProcessImage || fileSize <= maxSize) {
            emit(
              PictureCapturedState(
                state.model.copyWith(
                  imagePath: file.path,
                ),
              ),
            );
          } else {
            add(
              ProcessImageEvent(
                file: file,
                ratio: (fileSize / maxSize).ceilToDouble(),
              ),
            );
          }
        } else {
          emit(ReadyToCaptureState(state.model));
        }
      }
    } on CameraException catch (error) {
      emit(
        ErrorState(
          state.model,
          error: error,
        ),
      );
    }
  }

  void _onImageProcessingEvent(
    ProcessImageEvent event,
    Emitter<BlocCameraState> emit,
  ) async {
    try {
      emit(LoadingState(state.model));
      final resizedImage = await compute<ImageProcessingParam, img.Image>(
        (ImageProcessingParam param) {
          final imageFile = img.decodeImage(param.file.readAsBytesSync());
          final resizedImage = img.copyResize(
            imageFile!,
            height: imageFile.height ~/ param.compressionRatio,
            interpolation: img.Interpolation.average,
          );
          return resizedImage;
        },
        ImageProcessingParam(event.file, event.ratio),
      );
      final outputDir = await getTemporaryDirectory();
      final outputFile = File(
        '${outputDir.path}${Platform.pathSeparator}${pat.basenameWithoutExtension(event.file.path)}_resized.jpg',
      );
      outputFile.createSync(recursive: true);
      outputFile.writeAsBytesSync(img.encodeJpg(resizedImage));
      emit(
        PictureCapturedState(
          state.model.copyWith(
            imagePath: outputFile.path,
          ),
        ),
      );
    } on CameraException catch (error) {
      emit(
        ErrorState(
          state.model,
          error: error,
        ),
      );
    }
  }

  void _onClearCaptureEvent(
    ClearCaptureEvent event,
    Emitter<BlocCameraState> emit,
  ) {
    emit(
      ReadyToCaptureState(
        state.model.copyWith(
          imagePath: '',
        ),
      ),
    );
  }
}

class ImageProcessingParam {
  final File file;
  final double compressionRatio;

  ImageProcessingParam(
    this.file,
    this.compressionRatio,
  ) : assert(compressionRatio > 0);
}
