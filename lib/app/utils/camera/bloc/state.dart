part of 'bloc.dart';

@immutable
abstract class BlocCameraState extends Equatable {
  final Model model;

  const BlocCameraState(this.model);

  @override
  List<Object> get props => [model];
}

class InitialState extends BlocCameraState {
  const InitialState(Model model) : super(model);
}

class LoadingState extends BlocCameraState {
  const LoadingState(Model model) : super(model);
}

class ErrorState extends BlocCameraState {
  final CameraException error;

  const ErrorState(Model model, {required this.error}) : super(model);
}

class PictureCapturedState extends BlocCameraState {
  const PictureCapturedState(Model model) : super(model);
}

class ReadyToCaptureState extends BlocCameraState {
  const ReadyToCaptureState(Model model) : super(model);
}

class Model extends Equatable {
  final CameraController? cameraController;
  final FlashMode? flashMode;
  final String? imagePath;
  final Uint8List? imageMemory;
  final String? selfieImagePath;
  final Uint8List? selfieImageMemory;

  bool get hasImage =>
      (imagePath?.isNotEmpty ?? false) && File(imagePath!).existsSync();

  File? get imageFile => hasImage ? File(imagePath!) : null;
  
  bool get hasImageSelfie =>
      (selfieImagePath?.isNotEmpty ?? false) &&
      File(selfieImagePath!).existsSync();

  File? get selfieImageFile => hasImageSelfie ? File(selfieImagePath!) : null;

  const Model({
    this.cameraController,
    this.imagePath,
    this.flashMode = FlashMode.off,
    this.imageMemory,
    this.selfieImageMemory,
    this.selfieImagePath,
  });

  Model copyWith({
    CameraController? cameraController,
    String? imagePath,
    FlashMode? flashMode,
    Uint8List? imageMemory,
    String? selfieImagePath,
    Uint8List? selfieImageMemory,
  }) {
    return Model(
      cameraController: cameraController ?? this.cameraController,
      imagePath: imagePath ?? this.imagePath,
      flashMode: flashMode ?? this.flashMode,
      imageMemory: imageMemory ?? this.imageMemory,
      selfieImageMemory: selfieImageMemory ?? this.selfieImageMemory,
      selfieImagePath: selfieImagePath ?? this.selfieImagePath,
    );
  }

  @override
  List<Object?> get props => [
        imagePath,
        flashMode,
        cameraController,
        imageMemory,
        selfieImageMemory,
        selfieImagePath,
      ];
}
