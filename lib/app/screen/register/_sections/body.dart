part of 'package:r5/app/screen/register/page.dart';

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
        const Gap(R5Spacing.md),
        R5Text.body(
          label: R5UiValues.welcome,
          color: Colors.black,
          textStyle: GoogleFonts.lato(),
        ),
        const Gap(R5Spacing.sl),
        R5Text.small(
          label: R5UiValues.register,
          color: Colors.black,
          textStyle: GoogleFonts.lato(),
        ),
        const Gap(R5Spacing.md),
        SvgPicture.asset(
          R5UiValues.logor5,
          height: size.height * 0.1,
          width: size.width * 0.1,
        ),
        const Gap(R5Spacing.md),
        Padding(
          padding: const EdgeInsets.all(R5Spacing.md),
          child: FormLogin(
            formKey: formKeyLogin,
          ),
        ),
        BlocBuilder<BlocRegister, RegisterState>(
          builder: (context, state) {
            bool isFormValidate = state.model.isFormFilledLogin;
            return Button(
              title: R5UiValues.save,
              backgroundColor: R5Colors.primaryColor,
              onPressed: isFormValidate
                  ? () {
                      final formState = formKeyLogin.currentState;

                      if (isFormValidate && (formState?.validate() ?? true)) {
                        context.read<BlocRegister>().add(SendRegisterEvent());
                      } else {
                        showToast(
                          R5UiValues.completeTheData,
                          backgroundColor: R5Colors.rybBlue,
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
