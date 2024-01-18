import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r5/app/screen/login/repository.dart';
import 'package:r5/app/utils/config/firebase_instance.dart';

part 'event.dart';
part 'state.dart';

class BlocLogin extends Bloc<LoginEvent, LoginState> {
  BlocLogin({
    required this.repository,
    required this.firebaseInstace,
  }) : super(const InitialState(Model())) {
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
    on<SendLoginEvent>(_onSendLoginEvent);
  }
  final R5FirebaseInstance firebaseInstace;
  final Repository repository;

  void _onChangeEmailEvent(
    ChangeEmailEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(
      ChangedEmailState(
        state.model.copyWith(
          email: event.email,
        ),
      ),
    );
  }

  void _onChangePasswordEvent(
    ChangePasswordEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(
      ChangedPasswordState(
        state.model.copyWith(
          password: event.password,
        ),
      ),
    );
  }

  Future<void> _onSendLoginEvent(
    SendLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(LoadingLoginState(state.model));

      final userCredential =
          await firebaseInstace.firebaseAuth.signInWithEmailAndPassword(
        email: state.model.email,
        password: state.model.password,
      );

      emit(
        LoadedLoginState(
          state.model.copyWith(
            userCredential: userCredential,
          ),
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        ErrorLoginState(
          model: state.model,
          message: error.message ?? '',
        ),
      );
    }
  }
}
