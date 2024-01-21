part of 'package:r5/app/screen/auth/login/page.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
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
              return Validate.email(value as String)
                  ? null
                  : R5UiValues.verifyEmail;
            },
            onChanged: (value) {
              context.read<BlocLogin>().add(
                    ChangeEmailEvent(
                      email: value,
                    ),
                  );
            },
          ),
          const Gap(R5Spacing.md),
          BlocBuilder<BlocLogin, LoginState>(
            builder: (context, state) {
              final controllers = TextEditingController(
                text: state.model.password,
              );

              return XigoObscureInput(
                controller: controllers
                  ..selection = TextSelection.fromPosition(
                    TextPosition(
                      offset: controllers.text.length,
                    ),
                  ),
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
                onChanged: (value) {
                  context.read<BlocLogin>().add(
                        ChangePasswordEvent(
                          password: value,
                        ),
                      );
                },
              );
            },
          ),
          const Gap(R5Spacing.md),
        ],
      ),
    );
  }
}
