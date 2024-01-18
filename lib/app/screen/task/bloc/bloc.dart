import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r5/app/models/compare.dart';
import 'package:r5/app/models/liveness.dart';
import 'package:r5/app/screen/task/repository.dart';
import 'package:r5/app/models/document.dart';
import 'package:r5/app/utils/http/http_client.dart';

part 'event.dart';
part 'state.dart';

class BlocTask extends Bloc<TaskEvent, TaskState> {
  BlocTask({
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<ChangeDateEvent>(_onChangeDateEvent);
    on<ChangeCompletedEvent>(_onChangeCompletedEvent);
    on<ChangeDescriptionEvent>(_onChangeDescriptionEvent);
    on<ChangeTitleEvent>(_onChangeTitleEvent);
    on<ChangePassNumberEvent>(_onChangePassNumberEvent);
    on<ChangeInfoDetailEvent>(_onChangeInfoDetailEvent);
    on<ChangeSelfieImagenEvent>(_onChangeSelfieImagenEvent);
    on<GetDetailsEvent>(_onGetDetailsEvent);
    on<GetCompareRecognitionEvent>(_onGetCompareRecognitionEvent);
    on<GetLivenessDataEvent>(_onGetLivenessDataEvent);
  }
  final Repository repository;

  void _onChangeInfoDetailEvent(
    ChangeInfoDetailEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(
      ChangedDocumentDetailoState(
        state.model.copyWith(
          documentDetails: event.documentDetails,
          imageScanned: event.imageScanned,
        ),
      ),
    );
  }

  void _onChangeSelfieImagenEvent(
    ChangeSelfieImagenEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(
      ChangedSelfieImageState(
        state.model.copyWith(
          imageSelfie: event.imageSelfie,
        ),
      ),
    );
  }

  void _onChangeDateEvent(
    ChangeDateEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(
      ChangedDateState(
        state.model.copyWith(
          date: event.date,
        ),
      ),
    );
  }

  void _onChangeCompletedEvent(
    ChangeCompletedEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(
      ChangedCompleteState(
        state.model.copyWith(
          isCompleted: event.complete,
        ),
      ),
    );
  }

  void _onChangeDescriptionEvent(
    ChangeDescriptionEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(
      ChangedDescriptionState(
        state.model.copyWith(
          description: event.description,
        ),
      ),
    );
  }

  void _onChangeTitleEvent(
    ChangeTitleEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(
      ChangedDescriptionState(
        state.model.copyWith(
          title: event.title,
        ),
      ),
    );
  }

  void _onChangePassNumberEvent(
    ChangePassNumberEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(
      ChangedPassNumberState(
        state.model.copyWith(
          numberPass: event.passNumber,
        ),
      ),
    );
  }

  Future<void> _onGetDetailsEvent(
    GetDetailsEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      emit(LoadingDetailsState(state.model));
      final imageTemp = base64Encode(event.imageScanned);
      final documentDetails = await repository.getDetails(imageTemp);

      emit(
        LoadedDetailState(
          state.model.copyWith(
            documentDetails: documentDetails,
            imageScanned: event.imageScanned,
          ),
        ),
      );
    } catch (error) {
      if (error is DioException) {
        emit(
          ErrorDetailState(
            model: state.model,
            message: error.response?.data['message'] ?? '',
          ),
        );
        return;
      }
      emit(
        ErrorDetailState(
          model: state.model,
        ),
      );
    }
  }

  Future<void> _onGetCompareRecognitionEvent(
    GetCompareRecognitionEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      emit(LoadingCompareRecognitionState(state.model));
      final imageSelfie = base64Encode(state.model.imageSelfie!);
      final imageGallery = base64Encode(state.model.imageScanned!);

      final compareData = await repository.getCompareRecognition(
        probe: imageSelfie,
        gallery: imageGallery,
      );

      emit(
        LoadedCompareRecognitionState(
          state.model.copyWith(
            compare: compareData,
          ),
        ),
      );
    } catch (error) {
      if (error is DioException) {
        emit(
          ErrorCompareRecognitionState(
            model: state.model,
            message: error.response?.data['message'] ?? '',
          ),
        );
        return;
      }
      emit(
        ErrorCompareRecognitionState(
          model: state.model,
        ),
      );
    }
  }

  Future<void> _onGetLivenessDataEvent(
    GetLivenessDataEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      emit(LoadingLivenessState(state.model));
      final imageSelfie = base64Encode(state.model.imageSelfie!);
      final livenessData = await repository.getLiveness(
        image: imageSelfie,
      );

      emit(
        LoadedLivenessState(
          state.model.copyWith(
            liveness: livenessData,
          ),
        ),
      );
    } catch (e) {
      if (e is DioException) {
        emit(
          ErrorLivenessState(
            model: state.model,
            message: e.response?.data['message'] ?? '',
          ),
        );
        return;
      }

      emit(
        ErrorLivenessState(
          model: state.model,
        ),
      );
    }
  }
}
