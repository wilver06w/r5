import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:r5/app/screen/init/bloc/bloc.dart' as bloc;
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/config/client_config.dart';
import 'package:r5/app/utils/navigation.dart';
import 'package:r5/app/utils/r5_ui.dart';

part 'package:r5/app/screen/init/listeners/core.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: VerifikColors.backgroundColor,
      body: BlocProvider(
        create: (context) => bloc.Bloc(
          app: app,
        )..add(bloc.InitEvent()),
        child: BlocListener<bloc.Bloc, bloc.State>(
          listener: listener,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  R5UiValues.logor5,
                  height: size.height * 0.2,
                  width: size.width * 0.2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
