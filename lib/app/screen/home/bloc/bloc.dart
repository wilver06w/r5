import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r5/app/utils/config/firebase_instance.dart';
import 'package:r5/app/utils/r5_ui.dart';

part 'event.dart';
part 'state.dart';

class BlocHome extends Bloc<HomeEvent, HomeState> {
  BlocHome({
    required this.firebaseInstace,
  }) : super(const InitialState(Model())) {
    on<DeleteItemTaskEvent>(_onDeleteItemTaskEvent);
  }
  final R5FirebaseInstance firebaseInstace;

  Future<void> _onDeleteItemTaskEvent(
    DeleteItemTaskEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingDeleteItemState(state.model));

      firebaseInstace.firebaseFirestore
          .collection(
            R5UiValues.nameTaskBd,
          )
          .doc(
            firebaseInstace.firebaseAuth.currentUser?.uid,
          )
          .collection(
            R5UiValues.nameCollection,
          )
          .doc(event.id)
          .delete();

      emit(LoadedDeletedItemState(state.model));
    } on FirebaseException catch (error) {
      emit(
        ErrorDeleteItemState(
          model: state.model,
          message: error.message ?? '',
        ),
      );
    }
  }
}
