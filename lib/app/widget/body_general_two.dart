import 'package:flutter/material.dart';

class BodyGeneralTwo extends StatelessWidget {
  const BodyGeneralTwo({
    super.key,
    required this.widgetLeft,
    required this.widgetRight,
    this.bgColorLeft,
    this.bgColorRight,
  });

  final Widget widgetLeft;
  final Widget widgetRight;
  final Color? bgColorLeft;
  final Color? bgColorRight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: bgColorLeft,
              child: widgetLeft,
            ),
          ),
          Expanded(
            child: Container(
              color: bgColorRight,
              child: widgetRight,
            ),
          ),
        ],
      ),
    );
  }
}
