import 'package:flutter_modular/flutter_modular.dart';
import 'package:r5/app/screen/init/page.dart' as init;
import 'package:r5/app/screen/login/page.dart' as login;
import 'package:r5/app/screen/register/page.dart' as register;
import 'package:r5/app/screen/task/page.dart' as task;

class GlobalModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const init.Page(),
        transition: TransitionType.fadeIn,
      ),
      //TODO: aqui pude sacar esto a un modulo, pero por cuestiones de tiempo.
      ChildRoute(
        '/login',
        child: (_, args) => const login.Page(),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/register',
        child: (_, args) => const register.Page(),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/home',
        child: (_, args) => const task.Page(),
        transition: TransitionType.fadeIn,
      ),
    ];
  }
}
