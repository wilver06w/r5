import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oktoast/oktoast.dart';
import 'package:r5/app/models/task.dart';
import 'package:r5/app/screen/task/bloc/bloc.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/config/client_config.dart';
import 'package:r5/app/utils/config/firebase_instance.dart';
import 'package:r5/app/utils/functions.dart';
import 'package:r5/app/utils/http/http_client.dart' hide ModularWatchExtension;
import 'package:r5/app/utils/input/input.dart';
import 'package:r5/app/utils/r5_loading.dart';
import 'package:r5/app/utils/r5_ui.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';
import 'package:r5/app/widget/button.dart';
import 'package:r5/app/widget/checkbox.dart';

part 'package:r5/app/screen/task/_sections/body.dart';
part 'package:r5/app/screen/task/_sections/bottom.dart';
part 'package:r5/app/screen/task/_sections/button_task.dart';
part 'package:r5/app/screen/task/_sections/form_task.dart';
part 'package:r5/app/screen/task/_sections/input_description.dart';
part 'package:r5/app/screen/task/_sections/input_title.dart';

class Page extends StatelessWidget {
  const Page({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    final app = Modular.get<AppConfig>();
    return BlocProvider<BlocTask>(
      create: (context) => BlocTask(
        firebaseInstace: Modular.get<R5FirebaseInstance>(),
      )
        ..add(ValidateTaskDataEvent(
          task: task,
        ))
        ..add(
          ChangeDateEvent(
            date: DateTime.now(),
          ),
        ),
      child: BlocListener<BlocTask, TaskState>(
        listener: _listener,
        child: Scaffold(
          backgroundColor: R5Colors.backgroundColor,
          bottomNavigationBar: BodyBottom(app: app),
          body: const SafeArea(
            child: Body(),
          ),
        ),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, TaskState state) async {
  if (state is LoadingSaveTaskState) {
    R5Loading.show(context);
  } else if (state is LoadedSaveTaskState) {
    Navigator.pop(context);
    showToast(
      R5UiValues.taskCreateSuccesful,
      backgroundColor: R5Colors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
      duration: const Duration(seconds: 10),
    );
    Navigator.pop(context);
  } else if (state is LoadedEditTaskState) {
    Navigator.pop(context);
    showToast(
      R5UiValues.taskEditSuccesful,
      backgroundColor: R5Colors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
      duration: const Duration(seconds: 10),
    );
    Navigator.pop(context);
  } else if (state is ErrorSaveTaskState) {
    Navigator.pop(context);
    showToast(
      state.message,
      backgroundColor: R5Colors.rybBlue,
      textStyle: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
