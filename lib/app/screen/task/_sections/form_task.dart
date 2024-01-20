part of 'package:r5/app/screen/task/page.dart';

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
          const InputTitle(),
          const Gap(R5Spacing.md),
          BlocBuilder<BlocTask, TaskState>(
            builder: (context, state) {
              return R5Text.small(
                label:
                    '${Functions.textMothDay(moth: state.model.date?.month ?? 1, day: state.model.date?.day ?? 1)} ${state.model.date?.hour}:${state.model.date?.minute} | ${state.model.charactersDescription} ${R5UiValues.characters}',
                textStyle: GoogleFonts.lato(),
              );
            },
          ),
          const Gap(R5Spacing.md),
          const InputDescription(),
          const Gap(R5Spacing.md),
          Row(
            children: [
              BlocSelector<BlocTask, TaskState, bool>(
                selector: (state) {
                  return state.model.isCompleted;
                },
                builder: (context, state) {
                  return R5Checkbox(
                    value: state,
                    onChanged: (value) {
                      context.read<BlocTask>().add(
                            ChangeCompletedEvent(
                              complete: value ?? false,
                            ),
                          );
                    },
                  );
                },
              ),
              const Gap(R5Spacing.md),
              BlocBuilder<BlocTask, TaskState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      context.read<BlocTask>().add(
                            ChangeCompletedEvent(
                              complete: !state.model.isCompleted,
                            ),
                          );
                    },
                    child: R5Text.body(
                      label: R5UiValues.completed,
                    ),
                  );
                },
              ),
            ],
          ),
          const Gap(R5Spacing.md),
        ],
      ),
    );
  }
}
