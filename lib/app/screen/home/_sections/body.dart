part of 'package:r5/app/screen/home/page.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final r5FirebaseInstance = Modular.get<R5FirebaseInstance>();

    final refBd = r5FirebaseInstance.firebaseFirestore
        .collection(
          R5UiValues.nameTaskBd,
        )
        .doc(
          r5FirebaseInstance.firebaseAuth.currentUser?.uid,
        )
        .collection(
          R5UiValues.nameCollection,
        )
        .withConverter<Task>(
          fromFirestore: (snapshots, _) => Task.fromJson(snapshots.data()!),
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

              // Tu widget personalizado para mostrar un producto
              return Column(
                children: [
                  ...List.generate(
                    productos.length,
                    (index) => Container(
                      child: VerifikText.body(
                        label: productos[index].title,
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