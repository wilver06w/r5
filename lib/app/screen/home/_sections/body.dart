part of 'package:r5/app/screen/home/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final r5FirebaseInstance = Modular.get<R5FirebaseInstance>();

    final refBdInitial = r5FirebaseInstance.firebaseFirestore
        .collection(
          R5UiValues.nameTaskBd,
        )
        .doc(
          r5FirebaseInstance.firebaseAuth.currentUser?.uid,
        )
        .collection(
          R5UiValues.nameCollection,
        );
    final refBd = refBdInitial.withConverter<Task>(
      fromFirestore: (snapshots, _) => Task.fromJson(
        json: snapshots.data()!,
        id: snapshots.id,
      ),
      toFirestore: (task, _) => task.toJson(),
    );

    return Column(
      children: [
        const Gap(VerifikSpacing.md),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: VerifikSpacing.md),
          child: VerifikText.title(
            label: R5UiValues.todoListApp,
            color: Colors.black,
            textStyle: GoogleFonts.lato(),
          ),
        ),
        const Gap(VerifikSpacing.md),
        StreamBuilder(
            stream: refBd.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }

              final tasks =
                  snapshot.data!.docs.map((doc) => doc.data()).toList();

              return Column(
                children: [
                  ...List.generate(
                    tasks.length,
                    (index) {
                      final taskItem = tasks[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: VerifikSpacing.md,
                        ),
                        child: Card(
                          elevation: 3,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(VerifikSpacing.sm),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    VerifikText.body(
                                      label: taskItem.title,
                                      color: Colors.black,
                                      textStyle: GoogleFonts.lato(),
                                      fontWeight: FontWeight.bold,
                                    ),
                                    ContainerTime(
                                      dateTime: Functions.timeText(
                                          initial: taskItem.date),
                                    ),
                                  ],
                                ),
                                const Gap(VerifikSpacing.md),
                                VerifikText.small(
                                  label: taskItem.description,
                                  color: Colors.black,
                                  textStyle: GoogleFonts.lato(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        context.read<BlocHome>().add(
                                              DeleteItemTaskEvent(
                                                id: taskItem.id,
                                              ),
                                            );
                                      },
                                      child: const Icon(
                                        Icons.delete_outline_outlined,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }),
      ],
    );
  }
}
