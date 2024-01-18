part of 'package:r5/app/screen/home/page.dart';

class OptionsCards extends StatelessWidget {
  const OptionsCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: VerifikResponsive.heightSizeByContext(
          context,
          pixels: size.width > 600 ? 260 : 1000,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: VerifikResponsive.withSizeByContext(
            context,
            pixels: VerifikSpacing.xl,
          ),
        ),
        child: size.width > 600
            ? Row(
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
                    title: VerifikUiValues
                        .getYourIdentityAuthenticatedWithinMinute,
                    passNumber: '4',
                  ),
                ],
              )
            : Column(
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
                    title: VerifikUiValues
                        .getYourIdentityAuthenticatedWithinMinute,
                    passNumber: '4',
                  ),
                ],
              ));
  }
}
