import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:r5/app/config/app.dart';
import 'package:r5/app/config/module.dart';
import 'package:r5/app/utils/config/client_config.dart';
import 'package:r5/app/utils/config/firebase_instance.dart';
import 'package:r5/app/utils/preferences.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => Preferences()),
      Bind<R5FirebaseInstance>(
        (i) => R5FirebaseInstance().getInstance(),
      ),
      Bind(
        (i) {
          return AppConfig()
            ..version = App.instance.version
            ..infoDevice = App.instance.infoDevice;
        },
        isLazy: false,
      ),
      Bind((i) => GlobalKey<NavigatorState>()),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ModuleRoute('/', module: GlobalModule()),
    ];
  }
}
