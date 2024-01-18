import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r5/app/models/compare.dart';
import 'package:r5/app/models/liveness.dart';
import 'package:r5/app/screen/login/repository.dart';
import 'package:r5/app/models/document.dart';
import 'package:r5/app/utils/http/http_client.dart';

part 'event.dart';
part 'state.dart';

class BlocLogin extends Bloc<LoginEvent, LoginState> {
  BlocLogin({
    required this.repository,
  }) : super(const InitialState(Model())) {
    on<ChangeEmailEvent>(_onChangeEmailEvent);
    on<ChangePasswordEvent>(_onChangePasswordEvent);
  }
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
}
