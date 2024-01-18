import 'package:flutter_modular/flutter_modular.dart';
import 'package:r5/app/screen/task/page.dart' as task;

class GlobalModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const task.Page(),
        transition: TransitionType.fadeIn,
      ),
    ];
  }
}
