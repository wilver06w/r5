
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IconTap extends StatelessWidget {
  const IconTap({
    super.key,
    this.width = 30.0,
    this.height = 30.0,
    required this.iconRoute,
    required this.onTap,
  });

  final double width;
  final double height;
  final String iconRoute;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Lottie.asset(
        iconRoute,
        width: width,
        height: height,
      ),
    );
  }
}