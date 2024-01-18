part of 'package:r5/app/screen/task/page.dart';


class InputDescription extends StatelessWidget {
  const InputDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocTask, TaskState>(
      builder: (context, state) {
        final controllers = TextEditingController(
          text: state.model.description,
        );

        return XigoTextArea(
          controller: controllers
            ..selection = TextSelection.fromPosition(
              TextPosition(
                offset: controllers.text.length,
              ),
            ),
          hintText: R5UiValues.description,
          fillColor: Colors.white,
          isFilled: true,
          validator: (value) {
            if ((value ?? '').isEmpty) {
              return '${R5UiValues.description} ${R5UiValues.onRequired}';
            }
            return null;
          },
          onChanged: (value) {
            context.read<BlocTask>().add(
                  ChangeDescriptionEvent(
                    description: value,
                  ),
                );
          },
          textCapitalization: TextCapitalization.none,
        );
      },
    );
  }
}
