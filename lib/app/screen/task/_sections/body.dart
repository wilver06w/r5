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
        const Gap(VerifikSpacing.md),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: VerifikSpacing.md),
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
                  return VerifikText.body(
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
        const Gap(VerifikSpacing.md),
        Padding(
          padding: const EdgeInsets.all(VerifikSpacing.md),
          child: FormTask(
            formKey: formKeyTask,
          ),
        ),
        ButtonTask(formKeyTask: formKeyTask),
      ],
    );
  }
}
