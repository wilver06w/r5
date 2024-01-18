import 'package:flutter/material.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/responsive.dart';
import 'package:r5/app/utils/text/text.dart';

class ItemCircular extends StatelessWidget {
  const ItemCircular({
    super.key,
    required this.passNumber,
    this.isActive = true,
  });

  final bool isActive;
  final String passNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: VerifikResponsive.heightSizeByContext(
        context,
        pixels: 45,
      ),
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive
            ? VerifikColors.rybBlue
            : VerifikColors.rybBlue.withOpacity(0.10),
      ),
      child: Center(
        child: VerifikText.body(
          label: passNumber,
          color: Colors.white,
        ),
      ),
    );
  }
}
