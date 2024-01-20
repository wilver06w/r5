
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:r5/app/models/task.dart';
import 'package:r5/app/screen/home/page.dart';
import 'package:r5/app/utils/functions.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';

class ItemTask extends StatelessWidget {
  const ItemTask({
    super.key,
    required this.taskItem,
    required this.onTap,
    required this.onTapDelete,
  });

  final Task taskItem;
  final VoidCallback onTap;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: R5Spacing.md,
      ),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 3,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(R5Spacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    R5Text.body(
                      label: taskItem.title,
                      color: Colors.black,
                      textStyle: GoogleFonts.lato(),
                      fontWeight: FontWeight.bold,
                    ),
                    ContainerTime(
                      dateTime: Functions.timeText(initial: taskItem.date),
                    ),
                  ],
                ),
                const Gap(R5Spacing.md),
                R5Text.labelText(
                  label: taskItem.description,
                  color: Colors.black,
                  textStyle: GoogleFonts.lato(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: onTapDelete,
                      child: const Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
