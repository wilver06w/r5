import 'package:flutter_modular/flutter_modular.dart';
import 'package:r5/app/models/task.dart';

class R5Route {
  static Future<Object?> navHome() async {
    return Modular.to.pushNamedAndRemoveUntil(
      '/home',
      (_) => false,
    );
  }

  static Future<Object?> navAddTask({Task? task}) async {
    return Modular.to.pushNamed(
      '/task',
      arguments: {
        'task': task,
      },
    );
  }

  static Future<Object?> navLogin() async {
    return Modular.to.pushNamedAndRemoveUntil(
      '/auth/',
      (_) => false,
    );
  }

  static Future<Object?> navRegister() async {
    return Modular.to.pushNamed(
      '/auth/register',
    );
  }
}
