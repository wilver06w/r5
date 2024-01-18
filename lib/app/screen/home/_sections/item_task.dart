part of 'package:r5/app/screen/home/page.dart';

class ItemTask extends StatelessWidget {
  const ItemTask({
    super.key,
    required this.taskItem,
    required this.onTap,
    required this.onTapDelete,
  });

  final Task taskItem;
  final VoidCallback onTap;
  final VoidCallback onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: VerifikSpacing.md,
      ),
      child: InkWell(
        onTap: onTap,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    VerifikText.body(
                      label: taskItem.title,
                      color: Colors.black,
                      textStyle: GoogleFonts.lato(),
                      fontWeight: FontWeight.bold,
                    ),
                    ContainerTime(
                      dateTime: Functions.timeText(initial: taskItem.date),
                    ),
                  ],
                ),
                const Gap(VerifikSpacing.md),
                VerifikText.labelText(
                  label: taskItem.description,
                  color: Colors.black,
                  textStyle: GoogleFonts.lato(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: onTapDelete,
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
      ),
    );
  }
}
