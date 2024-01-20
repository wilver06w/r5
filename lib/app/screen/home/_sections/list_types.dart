part of 'package:r5/app/screen/home/page.dart';

class ListTypes extends StatelessWidget {
  const ListTypes({
    super.key,
    required this.tasks,
    required this.isCompleted,
  });

  final List<Task> tasks;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: R5Spacing.md),
          child: R5Text.title(
            label: isCompleted ? R5UiValues.completed : R5UiValues.inProgress,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            textStyle: GoogleFonts.lato(),
          ),
        ),
        const Gap(R5Spacing.xs),
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
  }
}
