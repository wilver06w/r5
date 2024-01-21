import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r5/app/utils/config/firebase_instance.dart';

part 'event.dart';
part 'state.dart';

class BlocRegister extends Bloc<RegisterEvent, RegisterState> {
  BlocRegister({
    required this.firebaseInstace,
  }) : super(const InitialState(Model())) {
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
    on<SendRegisterEvent>(_onSendRegisterEvent);
  }
  final R5FirebaseInstance firebaseInstace;

  void _onChangeEmailEvent(
    ChangeEmailEvent event,
    Emitter<RegisterState> emit,
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
    Emitter<RegisterState> emit,
  ) {
    emit(
      ChangedPasswordState(
        state.model.copyWith(
          password: event.password,
        ),
      ),
    );
  }

  Future<void> _onSendRegisterEvent(
    SendRegisterEvent event,
    Emitter<RegisterState> emit,
  ) async {
    try {
      emit(LoadingRegisterState(state.model));

      final userCredential =
          await firebaseInstace.firebaseAuth.createUserWithEmailAndPassword(
        email: state.model.email,
        password: state.model.password,
      );
      userCredential.user?.sendEmailVerification();

      emit(
        LoadedRegisterState(
          state.model.copyWith(
            userCredential: userCredential,
          ),
        ),
      );
    } on FirebaseAuthException catch (error) {
      emit(
        ErrorRegisterState(
          model: state.model,
          message: error.message ?? '',
        ),
      );
    }
  }
}
