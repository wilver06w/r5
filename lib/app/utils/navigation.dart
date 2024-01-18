import 'package:flutter_modular/flutter_modular.dart';

class R5Route {
  static Future<Object?> navAddTask() async {
    return Modular.to.pushNamed(
      '/home',
    );
  }

  static Future<Object?> navLogin() async {
    return Modular.to.pushNamedAndRemoveUntil(
      '/login',
      (_) => false,
    );
  }
//TODO: remover after
  // static Future<Object?> navMapsReplacement(
  //     {required ServicesPending data}) async {
  //   return await Modular.to.pushReplacementNamed(
  //     '/maps/',
  //     arguments: {
  //       'data': data,
  //     },
  //   );
  // }

  // static Future<Object?> navEdit() async {
  //   return await Modular.to.pushNamed('/profile/edit');
  // }
}
