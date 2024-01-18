import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:r5/app/screen/camera/page.dart';
import 'package:r5/app/screen/demo/bloc/bloc.dart';
import 'package:r5/app/screen/task/repository.dart';
import 'package:r5/app/screen/document/page.dart';
import 'package:r5/app/screen/result/page.dart';
import 'package:r5/app/screen/scanning/page.dart';
import 'package:r5/app/screen/task/bloc/bloc.dart';
import 'package:r5/app/utils/camera/bloc/bloc.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/config/client_config.dart';
import 'package:r5/app/utils/functions.dart';
import 'package:r5/app/utils/http/http_client.dart' hide ModularWatchExtension;
import 'package:r5/app/utils/input/input.dart';
import 'package:r5/app/utils/responsive.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';
import 'package:r5/app/utils/verifik_ui.dart';
import 'package:r5/app/widget/checkbox.dart';
import 'package:r5/app/widget/item_circular.dart';

part 'package:r5/app/screen/task/_sections/app_bar.dart';
part 'package:r5/app/screen/task/_sections/body_pass.dart';
part 'package:r5/app/screen/task/_sections/bottom.dart';
part 'package:r5/app/screen/task/_sections/header_pass.dart';
part 'package:r5/app/screen/task/_sections/item_card.dart';
part 'package:r5/app/screen/task/_sections/options_card.dart';

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
      ),
      child: Scaffold(
        backgroundColor: VerifikColors.backgroundColor,
        appBar: MyAppBar(
          imageCountryUrl: app.country.imageUrl,
        ),
        bottomNavigationBar: BodyBottom(app: app),
        body: const Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(VerifikSpacing.md),
      child: Column(
        children: [
          XigoTextField(
            controller: null,
            hintText: VerifikUiValues.title,
            fillColor: Colors.white,
            filled: true,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${VerifikUiValues.title} ${VerifikUiValues.onRequired}';
              }
              return null;
            },
            textInputFormatters: [
              FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]")),
            ],
            onChanged: (value) {
              // context.read<bloc.Bloc>().add(
              //       bloc.ChangeNameEvent(
              //         name: value,
              //       ),
              //     );
            },
          ),
          const Gap(VerifikSpacing.md),
          XigoTextArea(
            controller: null,
            hintText: VerifikUiValues.description,
            fillColor: Colors.white,
            isFilled: true,
            validator: (value) {
              if ((value ?? '').isEmpty) {
                return '${VerifikUiValues.description} ${VerifikUiValues.onRequired}';
              }
              return null;
            },
            onChanged: (value) {
              // context.read<bloc.Bloc>().add(
              //       bloc.ChangeNameEvent(
              //         name: value,
              //       ),
              //     );
            },
            textCapitalization: TextCapitalization.none,
          ),
          const Gap(VerifikSpacing.md),
          Row(
            children: [
              const R5Checkbox(),
              const Gap(VerifikSpacing.md),
              VerifikText.body(
                label: VerifikUiValues.completed,
              ),
            ],
          ),
          const Gap(VerifikSpacing.md),
          InkWell(
            onTap: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1996),
                lastDate: DateTime(2030),
              );

              if (selectedDate != null) {
                if (context.mounted) {
                  context.read<BlocTask>().add(
                        ChangeDateEvent(
                          date:
                              '${selectedDate.year}/${selectedDate.month}/${selectedDate.day}',
                        ),
                      );
                }
              }
            },
            child: BlocBuilder<BlocTask, TaskState>(
              builder: (context, state) {
                return XigoTextField(
                  controller: TextEditingController(
                    text: state.model.date,
                  ),
                  hintText: VerifikUiValues.date,
                  fillColor: Colors.white,
                  filled: true,
                  enabled: false,
                  validator: (value) {
                    if ((value ?? '').isEmpty) {
                      return '${VerifikUiValues.date} ${VerifikUiValues.onRequired}';
                    }
                    return null;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
