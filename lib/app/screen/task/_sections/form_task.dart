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
          XigoTextField(
            controller: null,
            hintText: R5UiValues.title,
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${R5UiValues.title} ${R5UiValues.onRequired}';
              }
              return null;
            },
            textInputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
            ],
            onChanged: (value) {
              context.read<BlocTask>().add(
                    ChangeTitleEvent(
                      title: value,
                    ),
                  );
            },
          ),
          const Gap(VerifikSpacing.md),
          BlocBuilder<BlocTask, TaskState>(
            builder: (context, state) {
              return VerifikText.small(
                label:
                    '${Functions.textMothDay(moth: state.model.date?.month ?? 1, day: state.model.date?.day ?? 1)} ${state.model.date?.hour}:${state.model.date?.minute} | ${state.model.charactersDescription} ${R5UiValues.characters}',
                textStyle: GoogleFonts.lato(),
              );
            },
          ),
          const Gap(VerifikSpacing.md),
          const InputDescription(),
          const Gap(VerifikSpacing.md),
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
              const Gap(VerifikSpacing.md),
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
                    child: VerifikText.body(
                      label: R5UiValues.completed,
                    ),
                  );
                },
              ),
            ],
          ),
          const Gap(VerifikSpacing.md),
        ],
      ),
    );
  }
}
