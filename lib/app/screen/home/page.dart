import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:r5/app/screen/demo/bloc/bloc.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/responsive.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';
import 'package:r5/app/utils/verifik_ui.dart';
import 'package:r5/app/widget/button.dart';
import 'package:r5/app/widget/item_circular.dart';

part 'package:r5/app/screen/home/_sections/item_card.dart';
part 'package:r5/app/screen/home/_sections/options_card.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        size.width > 600
            ? Positioned(
                bottom: 0,
                left: 0,
                child: Image.network(
                  VerifikUiValues.businessWomanImage,
                  height: VerifikResponsive.heightSizeByContext(context,
                      pixels: 470),
                ),
              )
            : const SizedBox.shrink(),
        ListView(
          padding: const EdgeInsets.symmetric(
            vertical: VerifikSpacing.xl,
            horizontal: VerifikSpacing.xl,
          ),
          children: [
            SvgPicture.network(
              VerifikUiValues.stepOneLogo,
              width: VerifikResponsive.withSizeByContext(context, pixels: 130),
              height:
                  VerifikResponsive.heightSizeByContext(context, pixels: 60),
            ),
            Gap(
              VerifikResponsive.heightSizeByContext(
                context,
                pixels: VerifikSpacing.lg,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: VerifikResponsive.withSizeByContext(
                  context,
                  pixels: VerifikSpacing.xxl,
                ),
              ),
              child: Column(
                children: [
                  VerifikText.fontSizeCustom(
                    label: VerifikUiValues
                        .exploreFutureIdentityValidationWithVerifik,
                    color: VerifikColors.rybBlue,
                    textAlign: TextAlign.center,
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  ),
                  Gap(
                    VerifikResponsive.heightSizeByContext(
                      context,
                      pixels: VerifikSpacing.md,
                    ),
                  ),
                  VerifikText.body(
                    label: VerifikUiValues.textWeFeatureCutting,
                    color: VerifikColors.catalinaBlue.withOpacity(0.60),
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                  Gap(
                    VerifikResponsive.heightSizeByContext(
                      context,
                      pixels: VerifikSpacing.md,
                    ),
                  ),
                  VerifikText.body(
                    label: VerifikUiValues.discoverVerifik,
                    color: VerifikColors.catalinaBlue.withOpacity(0.698),
                    fontWeight: FontWeight.w800,
                    textAlign: TextAlign.center,
                  ),
                  Gap(
                    VerifikResponsive.heightSizeByContext(
                      context,
                      pixels: VerifikSpacing.md,
                    ),
                  ),
                ],
              ),
            ),
            const OptionsCards(),
            Gap(
              VerifikResponsive.heightSizeByContext(
                context,
                pixels: VerifikSpacing.xl,
              ),
            ),
            Column(
              children: [
                Button(
                  title: VerifikUiValues.startDemo,
                  backgroundColor: VerifikColors.majorelleBlue,
                  onPressed: () {
                    context.read<BlocDemo>().add(
                          const ChangePassNumberEvent(
                            passNumber: 1,
                          ),
                        );
                  },
                ),
              ],
            ),
            Gap(
              VerifikResponsive.heightSizeByContext(
                context,
                pixels: VerifikSpacing.lg,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
