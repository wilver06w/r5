part of 'package:r5/app/screen/task/page.dart';

class ButtonTask extends StatelessWidget {
  const ButtonTask({
    super.key,
    required this.formKeyTask,
  });

  final GlobalKey<FormState> formKeyTask;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocTask, TaskState>(
      builder: (context, state) {
        bool isFormValidate = state.model.isFormFilledTask;
        return Button(
          title: state.model.isEdit
              ? R5UiValues.editTask
              : R5UiValues.save,
          backgroundColor: VerifikColors.primaryColor,
          onPressed: isFormValidate
              ? () {
                  final formState = formKeyTask.currentState;

                  if (isFormValidate && (formState?.validate() ?? true)) {
                    context.read<BlocTask>().add(SaveTaskEvent());
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
    );
  }
}
