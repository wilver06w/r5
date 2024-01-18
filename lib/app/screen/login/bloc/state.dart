part of 'bloc.dart';

abstract class LoginState extends Equatable {
  final Model model;
  const LoginState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends LoginState {
  const InitialState(Model model) : super(model);
}

class ChangedEmailState extends LoginState {
  const ChangedEmailState(Model model) : super(model);
}

class ChangedPasswordState extends LoginState {
  const ChangedPasswordState(Model model) : super(model);
}

class Model extends Equatable {
  const Model({
    this.email = '',
    this.password = '',
  });

  final String email;
  final String password;

  bool get isFormFilledLogin => (email.isNotEmpty) && (password.isNotEmpty);

  Model copyWith({
    String? email,
    String? password,
  }) {
    return Model(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props {
    return [
      email,
      password,
    ];
  }
}
