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
import 'package:r5/app/utils/functions.dart';
import 'package:r5/app/utils/http/http_client.dart' hide ModularWatchExtension;
import 'package:r5/app/utils/input/input.dart';
import 'package:r5/app/utils/r5_ui.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';
import 'package:r5/app/widget/button.dart';
import 'package:r5/app/widget/checkbox.dart';

part 'package:r5/app/screen/login/_sections/body.dart';
part 'package:r5/app/screen/login/_sections/bottom.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return BlocProvider<BlocLogin>(
      create: (context) => BlocLogin(
        repository: Repository(
          verifikHttpClient: Modular.get<VerifikHttpClient>(),
        ),
      ),
      child: Scaffold(
        backgroundColor: VerifikColors.backgroundColor,
        bottomNavigationBar: BodyBottom(app: app),
        body: const SafeArea(
          child: Body(),
        ),
      ),
    );
  }
}

class FormTask extends StatelessWidget {
  const FormTask({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XigoTextField(
            controller: null,
            hintText: R5UiValues.email,
            title: R5UiValues.email,
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${R5UiValues.email} ${R5UiValues.onRequired}';
              }
              return null;
            },
            textInputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
            ],
            onChanged: (value) {
              context.read<BlocLogin>().add(
                    ChangeEmailEvent(
                      email: value,
                    ),
                  );
            },
          ),
          const Gap(VerifikSpacing.md),
          XigoTextField(
            controller: null,
            hintText: R5UiValues.password,
            title: R5UiValues.password,
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${R5UiValues.password} ${R5UiValues.onRequired}';
              }
              return null;
            },
            textInputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
            ],
            onChanged: (value) {
              context.read<BlocLogin>().add(
                    ChangePasswordEvent(
                      password: value,
                    ),
                  );
            },
          ),
          const Gap(VerifikSpacing.md),
        ],
      ),
    );
  }
}
