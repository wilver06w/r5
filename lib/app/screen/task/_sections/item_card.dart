part of 'package:r5/app/screen/task/page.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.passNumber,
  });

  final String imageUrl;
  final String title;
  final String passNumber;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: VerifikResponsive.heightSizeByContext(
            context,
            pixels: 250,
          ),
          width: VerifikResponsive.withSizeByContext(
            context,
            pixels: 45,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.10),
                spreadRadius: 5.0,
                blurRadius: 7.0,
                offset: const Offset(
                  5,
                  3,
                ),
              ),
            ],
          ),
          margin: EdgeInsets.only(
            bottom: VerifikResponsive.heightSizeByContext(
              context,
              pixels: 20,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap(
                VerifikResponsive.withSizeByContext(
                  context,
                  pixels: VerifikSpacing.xs,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  imageUrl,
                  width: VerifikResponsive.withSizeByContext(
                    context,
                    pixels: 100,
                  ),
                  height: VerifikResponsive.heightSizeByContext(
                    context,
                    pixels: 124,
                  ),
                ),
              ),
              Gap(
                VerifikResponsive.heightSizeByContext(
                  context,
                  pixels: VerifikSpacing.md,
                ),
              ),
              VerifikText.body(
                label: title,
                fontWeight: FontWeight.w600,
                color: VerifikColors.catalinaBlue.withOpacity(0.60),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ItemCircular(
            passNumber: passNumber,
          ),
        ),
      ],
    );
  }
}
