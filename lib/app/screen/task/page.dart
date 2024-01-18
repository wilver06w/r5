import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:r5/app/screen/task/bloc/bloc.dart';
import 'package:r5/app/screen/task/repository.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/config/client_config.dart';
import 'package:r5/app/utils/functions.dart';
import 'package:r5/app/utils/http/http_client.dart' hide ModularWatchExtension;
import 'package:r5/app/utils/input/input.dart';
import 'package:r5/app/utils/r5_ui.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';
import 'package:r5/app/widget/button.dart';
import 'package:r5/app/widget/checkbox.dart';

part 'package:r5/app/screen/task/_sections/body.dart';
part 'package:r5/app/screen/task/_sections/bottom.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return BlocProvider<BlocTask>(
      create: (context) => BlocTask(
        repository: Repository(
          verifikHttpClient: Modular.get<VerifikHttpClient>(),
        ),
      )..add(
          ChangeDateEvent(
            date: DateTime.now(),
          ),
        ),
      child: Scaffold(
        backgroundColor: VerifikColors.backgroundColor,
        bottomNavigationBar: BodyBottom(app: app),
        body: const SafeArea(
          child: Body(),
        ),
      ),
    );
  }
}

class FormTask extends StatelessWidget {
  const FormTask({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          XigoTextField(
            controller: null,
            hintText: R5UiValues.title,
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${R5UiValues.title} ${R5UiValues.onRequired}';
              }
              return null;
            },
            textInputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
            ],
            onChanged: (value) {
              context.read<BlocTask>().add(
                    ChangeTitleEvent(
                      title: value,
                    ),
                  );
            },
          ),
          const Gap(VerifikSpacing.md),
          BlocBuilder<BlocTask, TaskState>(
            builder: (context, state) {
              return VerifikText.small(
                label:
                    '${Functions.textMothDay(moth: state.model.date?.month ?? 1, day: state.model.date?.day ?? 1)} ${state.model.date?.hour}:${state.model.date?.minute} | ${state.model.charactersDescription} ${R5UiValues.characters}',
                textStyle: GoogleFonts.lato(),
              );
            },
          ),
          const Gap(VerifikSpacing.md),
          XigoTextArea(
            controller: null,
            hintText: R5UiValues.description,
            fillColor: Colors.white,
            isFilled: true,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${R5UiValues.description} ${R5UiValues.onRequired}';
              }
              return null;
            },
            onChanged: (value) {
              context.read<BlocTask>().add(
                    ChangeDescriptionEvent(
                      description: value,
                    ),
                  );
            },
            textCapitalization: TextCapitalization.none,
          ),
          const Gap(VerifikSpacing.md),
          Row(
            children: [
              BlocSelector<BlocTask, TaskState, bool>(
                selector: (state) {
                  return state.model.isCompleted;
                },
                builder: (context, state) {
                  return R5Checkbox(
                    value: state,
                    onChanged: (value) {
                      context.read<BlocTask>().add(
                            ChangeCompletedEvent(
                              complete: value ?? false,
                            ),
                          );
                    },
                  );
                },
              ),
              const Gap(VerifikSpacing.md),
              BlocBuilder<BlocTask, TaskState>(
                builder: (context, state) {
                  return InkWell(
                    onTap: () {
                      context.read<BlocTask>().add(
                            ChangeCompletedEvent(
                              complete: !state.model.isCompleted,
                            ),
                          );
                    },
                    child: VerifikText.body(
                      label: R5UiValues.completed,
                    ),
                  );
                },
              ),
            ],
          ),
          const Gap(VerifikSpacing.md),
        ],
      ),
    );
  }
}
