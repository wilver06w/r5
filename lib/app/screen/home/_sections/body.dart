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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Modular.to.pop();
                },
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              ),
              VerifikText.body(
                label: R5UiValues.newTask,
                color: Colors.black,
                textStyle: GoogleFonts.lato(),
              ),
              const SizedBox.shrink(),
            ],
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

              final productos =
                  snapshot.data!.docs.map((doc) => doc.data()).toList();

              return Column(
                children: [
                  ...List.generate(
                    productos.length,
                    (index) => Padding(
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
                                    label: productos[index].title,
                                    color: Colors.black,
                                    textStyle: GoogleFonts.lato(),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ContainerTime(
                                    dateTime: Functions.timeText(
                                        initial: productos[index].date),
                                  ),
                                ],
                              ),
                              const Gap(VerifikSpacing.md),
                              VerifikText.small(
                                label: productos[index].description,
                                color: Colors.black,
                                textStyle: GoogleFonts.lato(),
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.delete_outline_outlined,
                                    color: Colors.red,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
      ],
    );
  }
}
