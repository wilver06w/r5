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

    return ListView(
      children: [
        const Gap(VerifikSpacing.md),
        SectionLogout(
          onTap: () {
            context.read<BlocHome>().add(LogoutEvent());
          },
        ),
        Center(
          child: VerifikText.title(
            label: R5UiValues.todoListApp,
            color: Colors.black,
            textStyle: GoogleFonts.lato(),
          ),
        ),
        const Gap(VerifikSpacing.md),
        BuilderList(
          refBd: refBd,
        ),
      ],
    );
  }
}
