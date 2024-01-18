part of 'package:r5/app/screen/login/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKeyLogin = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Gap(VerifikSpacing.md),
        VerifikText.body(
          label: R5UiValues.welcome,
          color: Colors.black,
          textStyle: GoogleFonts.lato(),
        ),
        const Gap(VerifikSpacing.md),
        SvgPicture.asset(
          R5UiValues.logor5,
          height: size.height * 0.1,
          width: size.width * 0.1,
        ),
        const Gap(VerifikSpacing.md),
        Padding(
          padding: const EdgeInsets.all(VerifikSpacing.md),
          child: FormLogin(
            formKey: formKeyLogin,
          ),
        ),
        BlocBuilder<BlocLogin, LoginState>(
          builder: (context, state) {
            bool isFormValidate = state.model.isFormFilledLogin;
            return Button(
              title: R5UiValues.save,
              backgroundColor: VerifikColors.primaryColor,
              onPressed: isFormValidate
                  ? () {
                      final formState = formKeyLogin.currentState;

                      if (isFormValidate && (formState?.validate() ?? true)) {
                        context.read<BlocLogin>().add(SendLoginEvent());
                      } else {
                        showToast(
                          R5UiValues.completeTheData,
                          backgroundColor: VerifikColors.rybBlue,
                          textStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        );
                        return;
                      }
                    }
                  : null,
            );
          },
        ),
      ],
    );
  }
}
