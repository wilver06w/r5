part of 'package:r5/app/screen/scanning/page.dart';

class ItemID extends StatelessWidget {
  const ItemID({
    super.key,
    this.isBackgroundWhite = false,
    required this.title,
    required this.imageUrl,
    required this.onPressed,
    required this.titleButton,
  });

  final bool isBackgroundWhite;
  final String title;
  final String imageUrl;
  final String titleButton;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.xxl,
          ),
        ),
        VerifikText.fontSizeCustom(
          label: title,
          color: VerifikColors.rybBlue,
          textAlign: TextAlign.center,
          fontSize: 25,
          fontWeight: FontWeight.w700,
        ),
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.md,
          ),
        ),
        Image.network(
          imageUrl,
          width: VerifikResponsive.withSizeByContext(
            context,
            pixels: 260,
          ),
          height: VerifikResponsive.heightSizeByContext(
            context,
            pixels: 170,
          ),
        ),
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.xxl,
          ),
        ),
        Button(
          title: titleButton,
          onPressed: onPressed,
          backgroundColor: VerifikColors.majorelleBlue,
        ),
      ],
    );
  }
}
