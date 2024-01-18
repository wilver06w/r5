part of 'package:r5/app/screen/task/page.dart';

class OptionsCards extends StatelessWidget {
  const OptionsCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: VerifikResponsive.heightSizeByContext(
        context,
        pixels: 260,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: VerifikResponsive.withSizeByContext(
          context,
          pixels: VerifikSpacing.xl,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ItemCard(
            imageUrl: VerifikUiValues.idInCardPng,
            title: VerifikUiValues.scanYourIdDocument,
            passNumber: '1',
          ),
          Gap(
            VerifikResponsive.withSizeByContext(
              context,
              pixels: VerifikSpacing.xs,
            ),
          ),
          const ItemCard(
            imageUrl: VerifikUiValues.x2Step2,
            title: VerifikUiValues.obtainVerifyInformationExtracted,
            passNumber: '2',
          ),
          Gap(
            VerifikResponsive.withSizeByContext(
              context,
              pixels: VerifikSpacing.xs,
            ),
          ),
          const ItemCard(
            imageUrl: VerifikUiValues.x2Step3,
            title: VerifikUiValues.livenessDetection,
            passNumber: '3',
          ),
          Gap(
            VerifikResponsive.withSizeByContext(
              context,
              pixels: VerifikSpacing.xs,
            ),
          ),
          const ItemCard(
            imageUrl: VerifikUiValues.x2Step4,
            title: VerifikUiValues.getYourIdentityAuthenticatedWithinMinute,
            passNumber: '4',
          ),
        ],
      ),
    );
  }
}
