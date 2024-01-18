part of 'package:r5/app/screen/task/page.dart';

class BodyBottom extends StatelessWidget {
  const BodyBottom({
    super.key,
    required this.app,
  });

  final AppConfig app;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: VerifikSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VerifikText.labelText(
              label: VerifikUiValues.textFooter,
            ),
            VerifikText.xSmall(
              label: '${VerifikUiValues.version} ${app.version}',
            ),
          ],
        ),
      ),
    );
  }
}
