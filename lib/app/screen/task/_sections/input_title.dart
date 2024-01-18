part of 'package:r5/app/screen/task/page.dart';

class InputTitle extends StatelessWidget {
  const InputTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocTask, TaskState>(
      builder: (context, state) {
        final controllers = TextEditingController(
          text: state.model.title,
        );

        return XigoTextField(
          controller: controllers
            ..selection = TextSelection.fromPosition(
              TextPosition(
                offset: controllers.text.length,
              ),
            ),
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
        );
      },
    );
  }
}
