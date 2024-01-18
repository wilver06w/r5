import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:r5/app/utils/responsive.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/r5_ui.dart';

class R5Loading {
  static void show(
    BuildContext context, {
    bool useRootNavigator = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: useRootNavigator,
      builder: (_) {
        return PopScope(
          canPop: false,
          child: Lottie.asset(
            R5UiValues.loadingAnimations,
            height: VerifikResponsive.heightSizeByContext(
              context,
              pixels: VerifikSpacing.xs,
            ),
            width: VerifikResponsive.withSizeByContext(
              context,
              pixels: VerifikSpacing.xs,
            ),
          ),
        );
      },
    );
  }
}
