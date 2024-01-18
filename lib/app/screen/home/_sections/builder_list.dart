part of 'package:r5/app/screen/home/page.dart';

class BuilderList extends StatelessWidget {
  const BuilderList({
    super.key,
    required this.refBd,
    this.isCompleted = false,
  });

  final CollectionReference<Task> refBd;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: VerifikSpacing.md),
          child: VerifikText.title(
            label: isCompleted ? R5UiValues.completed : R5UiValues.inProgress,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            textStyle: GoogleFonts.lato(),
          ),
        ),
        const Gap(VerifikSpacing.xs),
        StreamBuilder(
          stream: refBd.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(
                '${R5UiValues.errror}: ${snapshot.error}',
              );
            }

            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }

            final tasks = snapshot.data!.docs.map((doc) => doc.data()).toList()
              ..removeWhere((element) => element.completed != isCompleted);

            return Column(
              children: [
                ...List.generate(
                  tasks.length,
                  (index) {
                    final taskItem = tasks[index];
                    return ItemTask(
                      taskItem: taskItem,
                      onTapDelete: () {
                        context.read<BlocHome>().add(
                              DeleteItemTaskEvent(
                                id: taskItem.id,
                              ),
                            );
                      },
                      onTap: () {
                        R5Route.navAddTask(
                          task: taskItem,
                        );
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
