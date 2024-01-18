import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:r5/app/models/item_time.dart';
import 'package:r5/app/models/task.dart';
import 'package:r5/app/screen/home/bloc/bloc.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/config/client_config.dart';
import 'package:r5/app/utils/config/firebase_instance.dart';
import 'package:r5/app/utils/functions.dart';
import 'package:r5/app/utils/http/http_client.dart' hide ModularWatchExtension;
import 'package:r5/app/utils/navigation.dart';
import 'package:r5/app/utils/r5_loading.dart';
import 'package:r5/app/utils/r5_ui.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';

part 'package:r5/app/screen/home/_sections/body.dart';
part 'package:r5/app/screen/home/_sections/bottom.dart';
part 'package:r5/app/screen/home/_sections/container_time.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return BlocProvider<BlocHome>(
      create: (context) => BlocHome(
        firebaseInstace: Modular.get<R5FirebaseInstance>(),
      ),
      child: BlocListener<BlocHome, HomeState>(
        listener: _listener,
        child: Scaffold(
          backgroundColor: VerifikColors.backgroundColor,
          bottomNavigationBar: BodyBottom(app: app),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              R5Route.navAddTask();
            },
            backgroundColor: Colors.blue,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: const SafeArea(
            child: Body(),
          ),
        ),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, HomeState state) async {
  if (state is LoadingDeleteItemState) {
    R5Loading.show(context);
  } else if (state is LoadedDeletedItemState) {
    Navigator.pop(context);
    showToast(
      R5UiValues.deleteTaskSuccess,
      backgroundColor: VerifikColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
      duration: const Duration(seconds: 10),
    );
  } else if (state is ErrorDeleteItemState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: VerifikColors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
