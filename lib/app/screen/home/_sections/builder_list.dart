part of 'package:r5/app/screen/home/page.dart';

class BuilderList extends StatelessWidget {
  const BuilderList({
    super.key,
    required this.refBd,
  });

  final CollectionReference<Task> refBd;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: refBd.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(
            '${R5UiValues.errror}: ${snapshot.error}',
          );
        }

        if (!snapshot.hasData) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              CircularProgressIndicator(),
            ],
          );
        }

        final tasks = snapshot.data!.docs.map((doc) => doc.data()).toList();
        final tasksCompleted = snapshot.data!.docs
            .map((doc) => doc.data())
            .toList()
          ..removeWhere((element) => element.completed);
        final tasksNoCompleted = snapshot.data!.docs
            .map((doc) => doc.data())
            .toList()
          ..removeWhere((element) => !element.completed);

        if (tasks.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Lottie.asset(
                R5UiValues.noDataLottie,
              ),
            ],
          );
        }
        return Column(
          children: [
            if (tasksCompleted.isNotEmpty) ...[
              ListTypes(
                tasks: tasksCompleted,
                isCompleted: true,
              ),
              const Gap(R5Spacing.md),
            ],
            if (tasksNoCompleted.isNotEmpty) ...[
              ListTypes(
                tasks: tasksNoCompleted,
                isCompleted: false,
              ),
            ],
          ],
        );
      },
    );
  }
}
