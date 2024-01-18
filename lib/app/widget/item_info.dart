import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/responsive.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';

class ItemInfo extends StatelessWidget {
  const ItemInfo({
    super.key,
    this.isLast = false,
    required this.title,
    required this.subTitle,
  });
  final bool isLast;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: VerifikColors.azureishWhite,
          height: 10,
        ),
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.xs,
          ),
        ),
        VerifikText.body(
          label: title,
          color: Colors.black,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w800,
        ),
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.xs,
          ),
        ),
        VerifikText.labelText(
          label: subTitle,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        if (isLast) ...[
          Gap(
            VerifikResponsive.heightSizeByContext(
              context,
              pixels: VerifikSpacing.xs,
            ),
          ),
          const Divider(
            color: VerifikColors.azureishWhite,
            height: 10,
          ),
          Gap(
            VerifikResponsive.heightSizeByContext(
              context,
              pixels: VerifikSpacing.md,
            ),
          ),
        ]
      ],
    );
  }
}
