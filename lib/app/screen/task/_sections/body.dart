part of 'package:r5/app/screen/task/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formKeyTask = GlobalKey<FormState>();
    return Column(
      children: [
        const Gap(R5Spacing.md),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: R5Spacing.md),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Modular.to.pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              BlocBuilder<BlocTask, TaskState>(
                builder: (context, state) {
                  return R5Text.body(
                    label: state.model.isEdit
                        ? R5UiValues.editTask
                        : R5UiValues.newTask,
                    color: Colors.black,
                    textStyle: GoogleFonts.lato(),
                  );
                },
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
        const Gap(R5Spacing.md),
        Padding(
          padding: const EdgeInsets.all(R5Spacing.md),
          child: FormTask(
            formKey: formKeyTask,
          ),
        ),
        ButtonTask(formKeyTask: formKeyTask),
      ],
    );
  }
}
