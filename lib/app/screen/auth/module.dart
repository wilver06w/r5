import 'package:flutter_modular/flutter_modular.dart';
import 'package:r5/app/screen/auth/login/page.dart' as login;
import 'package:r5/app/screen/auth/register/page.dart' as register;

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  List<ModularRoute> get routes {
    return [
      ChildRoute(
        Modular.initialRoute,
        child: (_, args) => const login.Page(),
        transition: TransitionType.fadeIn,
      ),
      ChildRoute(
        '/register',
        child: (_, args) => const register.Page(),
        transition: TransitionType.fadeIn,
      ),
    ];
  }
}
