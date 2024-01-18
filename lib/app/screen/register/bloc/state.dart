part of 'bloc.dart';

abstract class RegisterState extends Equatable {
  final Model model;
  const RegisterState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends RegisterState {
  const InitialState(Model model) : super(model);
}

class ChangedEmailState extends RegisterState {
  const ChangedEmailState(Model model) : super(model);
}

class ChangedPasswordState extends RegisterState {
  const ChangedPasswordState(Model model) : super(model);
}

class LoadingRegisterState extends RegisterState {
  const LoadingRegisterState(Model model) : super(model);
}

class LoadedRegisterState extends RegisterState {
  const LoadedRegisterState(Model model) : super(model);
}

class ErrorRegisterState extends RegisterState {
  const ErrorRegisterState({required Model model, required this.message})
      : super(model);
  final String message;
}

class Model extends Equatable {
  const Model({
    this.email = '',
    this.password = '',
    this.userCredential,
  });

  final String email;
  final String password;
  final UserCredential? userCredential;

  bool get isFormFilledLogin => (email.isNotEmpty) && (password.isNotEmpty);

  Model copyWith({
    String? email,
    String? password,
    UserCredential? userCredential,
  }) {
    return Model(
      email: email ?? this.email,
      password: password ?? this.password,
      userCredential: userCredential ?? this.userCredential,
    );
  }

  @override
  List<Object?> get props {
    return [
      email,
      password,
      userCredential,
    ];
  }
}
