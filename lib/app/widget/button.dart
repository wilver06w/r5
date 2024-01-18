import 'package:flutter/material.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/responsive.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.title,
    this.onPressed,
    this.colorText = Colors.white,
    this.borderColor = VerifikColors.majorelleBlue,
    this.backgroundColor,
  });
  final String title;
  final VoidCallback? onPressed;
  final Color colorText;
  final Color borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: backgroundColor,
        shape: onPressed != null
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(
                  color: borderColor,
                ),
              )
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: VerifikResponsive.withSizeByContext(
            context,
            pixels: VerifikSpacing.xs,
          ),
          vertical: VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.sm,
          ),
        ),
        child: VerifikText.labelText(
          label: title,
          color: colorText,
        ),
      ),
    );
  }
}
