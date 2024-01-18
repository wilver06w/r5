import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/functions.dart';
import 'package:r5/app/utils/responsive.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';

class ItemPercent extends StatelessWidget {
  const ItemPercent({
    super.key,
    required this.title,
    required this.percent,
    required this.colorsProgress,
    this.colorText = VerifikColors.rybBlue,
  });

  final String title;
  final double percent;
  final Color colorsProgress;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerifikText.fontSizeCustom(
          label: title,
          fontSize: 20,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.sm,
          ),
        ),
        CircularPercentIndicator(
          radius: 90.0,
          lineWidth: 20.0,
          percent: percent,
          center: VerifikText.fontSizeCustom(
            label: '${Functions.convertirAInt(
              value: percent,
            )}%',
            color: colorText,
            fontSize: 35,
          ),
          backgroundColor: VerifikColors.azureishWhite,
          progressColor: colorsProgress,
        ),
      ],
    );
  }
}
