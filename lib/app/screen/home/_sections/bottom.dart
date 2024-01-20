part of 'package:r5/app/screen/home/page.dart';

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
        padding: const EdgeInsets.symmetric(vertical: R5Spacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            R5Text.small(
              label: R5UiValues.textFooter,
              textStyle: GoogleFonts.lato(),
            ),
            R5Text.xSmall(
              label: '${R5UiValues.version} ${app.version}',
            ),
          ],
        ),
      ),
    );
  }
}
