part of 'package:r5/app/screen/init/page.dart';

void listener(BuildContext context, bloc.State state) {
  if (state is bloc.LoadedState) {
    R5Route.navAddTask();
  }
  if (state is bloc.UnLoggedState) {
    Future.delayed(const Duration(seconds: 1), () {
      //TODO: revisar.
      // R5Route.navNavigateAuth();
    });
  }
}
