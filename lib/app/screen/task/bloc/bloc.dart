import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r5/app/models/task.dart';
import 'package:r5/app/utils/config/firebase_instance.dart';
import 'package:r5/app/utils/r5_ui.dart';

part 'event.dart';
part 'state.dart';

class BlocTask extends Bloc<TaskEvent, TaskState> {
  BlocTask({
    required this.firebaseInstace,
  }) : super(const InitialState(Model())) {
    on<ChangeDateEvent>(_onChangeDateEvent);
    on<ValidateTaskDataEvent>(_onValidateTaskDataEvent);
    on<ChangeCompletedEvent>(_onChangeCompletedEvent);
    on<ChangeDescriptionEvent>(_onChangeDescriptionEvent);
    on<ChangeTitleEvent>(_onChangeTitleEvent);
    on<SaveTaskEvent>(_onSaveTaskEvent);
    on<EditTaskEvent>(_onEditTaskEvent);
  }
  final R5FirebaseInstance firebaseInstace;

  Future<void> _onSaveTaskEvent(
    SaveTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      emit(LoadingSaveTaskState(state.model));

      final refBd = firebaseInstace.firebaseFirestore
          .collection(
            R5UiValues.nameTaskBd,
          )
          .doc(
            firebaseInstace.firebaseAuth.currentUser?.uid,
          )
          .collection(
            R5UiValues.nameCollection,
          );

      refBd.add({
        'title': state.model.title,
        'description': state.model.description,
        'completed': state.model.isCompleted,
        'date': state.model.date,
      });

      emit(LoadedSaveTaskState(state.model));
    } on FirebaseException catch (error) {
      emit(
        ErrorSaveTaskState(
          model: state.model,
          message: error.message ?? '',
        ),
      );
    }
  }

  Future<void> _onEditTaskEvent(
    EditTaskEvent event,
    Emitter<TaskState> emit,
  ) async {
    try {
      emit(LoadingSaveTaskState(state.model));

      final refBd = firebaseInstace.firebaseFirestore
          .collection(
            R5UiValues.nameTaskBd,
          )
          .doc(
            firebaseInstace.firebaseAuth.currentUser?.uid,
          )
          .collection(
            R5UiValues.nameCollection,
          )
          .doc(state.model.id);

      refBd.update({
        'title': state.model.title,
        'description': state.model.description,
        'completed': state.model.isCompleted,
        'date': state.model.date,
      });

      emit(LoadedSaveTaskState(state.model));
    } on FirebaseException catch (error) {
      emit(
        ErrorSaveTaskState(
          model: state.model,
          message: error.message ?? '',
        ),
      );
    }
  }

  void _onValidateTaskDataEvent(
    ValidateTaskDataEvent event,
    Emitter<TaskState> emit,
  ) {
    emit(
      ChangedValidateTaskDateState(
        state.model.copyWith(
          id: event.task.id,
          title: event.task.title,
          description: event.task.description,
          isCompleted: event.task.completed,
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
}
