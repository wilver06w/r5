import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:r5/app/screen/register/bloc/bloc.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/config/client_config.dart';
import 'package:r5/app/utils/config/firebase_instance.dart';
import 'package:r5/app/utils/http/http_client.dart' hide ModularWatchExtension;
import 'package:r5/app/utils/input/input.dart';
import 'package:r5/app/utils/r5_loading.dart';
import 'package:r5/app/utils/r5_ui.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';
import 'package:r5/app/utils/validations_inputs.dart';
import 'package:r5/app/widget/button.dart';

import '../../utils/navigation.dart';

part 'package:r5/app/screen/register/_sections/body.dart';
part 'package:r5/app/screen/register/_sections/bottom.dart';
part 'package:r5/app/screen/register/_sections/form_login.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return BlocProvider<BlocRegister>(
      create: (context) => BlocRegister(
        firebaseInstace: Modular.get<R5FirebaseInstance>(),
      ),
      child: BlocListener<BlocRegister, RegisterState>(
        listener: _listener,
        child: Scaffold(
          backgroundColor: R5Colors.backgroundColor,
          bottomNavigationBar: BodyBottom(app: app),
          body: const SafeArea(
            child: Body(),
          ),
        ),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, RegisterState state) async {
  if (state is LoadingRegisterState) {
    R5Loading.show(context);
  } else if (state is LoadedRegisterState) {
    Navigator.pop(context);
    showToast(
      '${R5UiValues.userRegisterSuccesful}\n${R5UiValues.nowYouCanLogIn}',
      backgroundColor: R5Colors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
      duration: const Duration(seconds: 10),
    );
    R5Route.navLogin();
  } else if (state is ErrorRegisterState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: R5Colors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
