import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:r5/app/models/task.dart';
import 'package:r5/app/screen/home/page.dart';
import 'package:r5/app/utils/functions.dart';
import 'package:r5/app/utils/r5_ui.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';
import 'package:r5/app/widget/item_task/bloc/bloc.dart';

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
    return BlocProvider(
      create: (context) => BlocItemTask(
        itemTask: taskItem,
      ),
      child: Padding(
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
                  const Gap(R5Spacing.md),
                  BlocSelector<BlocItemTask, ItemTaskState, bool>(
                    selector: (state) {
                      return state.model.isViewTraslate;
                    },
                    builder: (context, state) {
                      return InkWell(
                        onTap: () {
                          context.read<BlocItemTask>().add(
                                ChangeIsViewTraslateEvent(),
                              );
                        },
                        child: R5Text.small(
                          label: R5UiValues.organizeTextTraduction(
                            primary: state ? R5UiValues.see : R5UiValues.gone,
                            description: R5UiValues.spanishTranslation,
                          ),
                          color: Colors.blue,
                          textStyle: GoogleFonts.robotoMono(),
                        ),
                      );
                    },
                  ),
                  const Gap(R5Spacing.md),
                  BlocBuilder<BlocItemTask, ItemTaskState>(
                    builder: (context, state) {
                      return BlocSelector<BlocItemTask, ItemTaskState, bool>(
                        selector: (state) {
                          return state.model.isViewTraslate;
                        },
                        builder: (context, state) {
                          return state
                              ? const SizedBox.shrink()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    R5Text.body(
                                      label: taskItem.ttitle,
                                      color: Colors.black,
                                      textStyle: GoogleFonts.lato(),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const Gap(R5Spacing.md),
                                    R5Text.labelText(
                                      label: taskItem.tdescription,
                                      color: Colors.black,
                                      textStyle: GoogleFonts.lato(),
                                    ),
                                  ],
                                );
                        },
                      );
                    },
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
      ),
    );
  }
}
