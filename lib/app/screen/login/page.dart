import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:r5/app/screen/login/bloc/bloc.dart';
import 'package:r5/app/screen/login/repository.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/config/client_config.dart';
import 'package:r5/app/utils/config/firebase_instance.dart';
import 'package:r5/app/utils/http/http_client.dart' hide ModularWatchExtension;
import 'package:r5/app/utils/input/input.dart';
import 'package:r5/app/utils/preferences.dart';
import 'package:r5/app/utils/r5_loading.dart';
import 'package:r5/app/utils/r5_ui.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';
import 'package:r5/app/utils/validations_inputs.dart';
import 'package:r5/app/widget/button.dart';

import '../../utils/navigation.dart';

part 'package:r5/app/screen/login/_sections/body.dart';
part 'package:r5/app/screen/login/_sections/bottom.dart';
part 'package:r5/app/screen/login/_sections/form_login.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return BlocProvider<BlocLogin>(
      create: (context) => BlocLogin(
        firebaseInstace: Modular.get<R5FirebaseInstance>(),
        repository: Repository(
          verifikHttpClient: Modular.get<VerifikHttpClient>(),
        ),
        prefs: Modular.get<Preferences>(),
      ),
      child: BlocListener<BlocLogin, LoginState>(
        listener: _listener,
        child: Scaffold(
          backgroundColor: VerifikColors.backgroundColor,
          bottomNavigationBar: BodyBottom(app: app),
          body: const SafeArea(
            child: Body(),
          ),
        ),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, LoginState state) async {
  if (state is LoadingLoginState) {
    R5Loading.show(context);
  } else if (state is LoadedLoginState) {
    Navigator.pop(context);
    if (!(state.model.userCredential?.user?.emailVerified ?? true)) {
      state.model.userCredential?.user?.sendEmailVerification();
      showToast(
        R5UiValues.verifyEmail,
        backgroundColor: VerifikColors.rybBlue,
        textStyle: const TextStyle(
          color: Colors.white,
        ),
        duration: const Duration(
          seconds: 7,
        ),
      );
      return;
    }
    R5Route.navAddTask();
  } else if (state is ErrorLoginState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: VerifikColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
