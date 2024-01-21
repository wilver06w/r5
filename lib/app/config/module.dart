import 'package:flutter_modular/flutter_modular.dart';
import 'package:r5/app/models/task.dart';
import 'package:r5/app/screen/auth/module.dart';
import 'package:r5/app/screen/home/page.dart' as home;
import 'package:r5/app/screen/init/page.dart' as init;
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
      ChildRoute(
        '/home',
        child: (_, args) => const home.Page(),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/task',
        child: (_, args) => task.Page(
          task: (args.data ?? {})['task'] ??
              Task(
                id: '',
                date: DateTime.now(),
              ),
        ),
        transition: TransitionType.fadeIn,
      ),
      ModuleRoute('/auth', module: AuthModule()),
    ];
  }
}
