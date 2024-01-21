part of 'bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class ChangeEmailEvent extends RegisterEvent {
  const ChangeEmailEvent({
    required this.email,
  });

  final String email;
}

class ChangePasswordEvent extends RegisterEvent {
  const ChangePasswordEvent({
    required this.password,
  });

  final String password;
}

class SendRegisterEvent extends RegisterEvent {}
