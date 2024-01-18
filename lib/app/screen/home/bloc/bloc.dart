import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r5/app/utils/config/firebase_instance.dart';
import 'package:r5/app/utils/preferences.dart';
import 'package:r5/app/utils/r5_ui.dart';

part 'event.dart';
part 'state.dart';

class BlocHome extends Bloc<HomeEvent, HomeState> {
  BlocHome({
    required this.firebaseInstace,
    required this.prefs,
  }) : super(const InitialState(Model())) {
    on<DeleteItemTaskEvent>(_onDeleteItemTaskEvent);
    on<LogoutEvent>(_onLogoutEvent);
  }
  final R5FirebaseInstance firebaseInstace;
  final Preferences prefs;

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

  Future<void> _onLogoutEvent(
    LogoutEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(LoadingLogoutState(state.model));
      firebaseInstace.firebaseAuth.signOut();

      prefs.isLogged = false;
      prefs.uid = '';
      prefs.token = '';
      prefs.refreshToken = '';

      emit(LoadedLogoutState(state.model));
    } on FirebaseException catch (error) {
      emit(
        ErrorLogoutState(
          model: state.model,
          message: error.message ?? '',
        ),
      );
    }
  }
}
