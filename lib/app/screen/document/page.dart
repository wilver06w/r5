import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:gap/gap.dart';
import 'package:r5/app/models/item_section.dart';
import 'package:r5/app/screen/demo/bloc/bloc.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/config/client_config.dart';
import 'package:r5/app/utils/responsive.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';
import 'package:r5/app/utils/verifik_ui.dart';
import 'package:r5/app/widget/body_general_two.dart';
import 'package:r5/app/widget/button.dart';
import 'package:r5/app/widget/item_info.dart';

part 'package:r5/app/screen/document/_sections/info_left.dart';
part 'package:r5/app/screen/document/_sections/info_right.dart';
part 'package:r5/app/screen/document/_sections/section_info.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return BodyGeneralTwo(
      bgColorRight: Colors.white,
      widgetLeft: const InfoLeft(),
      widgetRight: InfoRight(
        app: app,
      ),
    );
  }
}
