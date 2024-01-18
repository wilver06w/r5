import 'dart:async';

import 'package:bloc/bloc.dart' as bloc;
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:r5/app/utils/config/client_config.dart';
import 'package:r5/app/utils/config/firebase_instance.dart';
import 'package:r5/app/utils/preferences.dart';

part 'event.dart';
part 'state.dart';

class Bloc extends bloc.Bloc<Event, State> {
  Bloc({
    // required this.repositoryCode,
    required this.app,
    required this.prefs,
    required this.firebaseIns,
    // required this.httpClient,
    // required this.prefs,
    // required this.tokenRepository,
  }) : super(const InitialState(Model())) {
    on<InitEvent>(_onLoadEvent);
  }

  final AppConfig app;
  final Preferences prefs;
  final R5FirebaseInstance firebaseIns;

  Future<void> _onLoadEvent(
    InitEvent event,
    Emitter<State> emit,
  ) async {
    try {
      if (!prefs.isLogged || prefs.token.isEmpty) {
        emit(
          UnLoggedState(
            state.model.copyWith(
              key: UniqueKey(),
            ),
          ),
        );
        return;
      }
      emit(LoadedState(state.model));
    } catch (e) {
      emit(ErrorState(state.model));
    }
  }
}
