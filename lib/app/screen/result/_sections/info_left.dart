part of 'package:r5/app/screen/result/page.dart';

class InfoLeft extends StatelessWidget {
  const InfoLeft({
    super.key,
  });

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
          label: VerifikUiValues.selfie,
          color: VerifikColors.rybBlue.withAlpha(77),
          textAlign: TextAlign.center,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.xs,
          ),
        ),
        BlocBuilder<BlocDemo, DemoState>(
          builder: (context, state) {
            return state.model.imageSelfie != null
                ? Image.memory(
                    state.model.imageSelfie!,
                    width: VerifikResponsive.withSizeByContext(
                      context,
                      pixels: 350,
                    ),
                    height: VerifikResponsive.heightSizeByContext(
                      context,
                      pixels: 197,
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.lg,
          ),
        ),
        VerifikText.fontSizeCustom(
          label: VerifikUiValues.documentScanned,
          color: VerifikColors.rybBlue.withAlpha(77),
          textAlign: TextAlign.center,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.lg,
          ),
        ),
        VerifikText.fontSizeCustom(
          label: VerifikUiValues.frontSide,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.xs,
          ),
        ),
        BlocBuilder<BlocDemo, DemoState>(
          builder: (context, state) {
            return state.model.imageScanned != null
                ? Image.memory(
                    state.model.imageScanned!,
                    width: VerifikResponsive.withSizeByContext(
                      context,
                      pixels: 350,
                    ),
                    height: VerifikResponsive.heightSizeByContext(
                      context,
                      pixels: 197,
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
