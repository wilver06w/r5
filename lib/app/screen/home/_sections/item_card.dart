part of 'package:r5/app/screen/home/page.dart';

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
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: VerifikResponsive.heightSizeByContext(
            context,
            pixels: size.width > 600 ? 250 : 200,
          ),
          width: VerifikResponsive.withSizeByContext(
            context,
            pixels: size.width > 600 ? 45 : 150,
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
              size.width > 600
                  ? Gap(
                      VerifikResponsive.heightSizeByContext(
                        context,
                        pixels: VerifikSpacing.xs,
                      ),
                    )
                  : const SizedBox.shrink(),
              Padding(
                padding: EdgeInsets.all(
                  size.width < 874 ? VerifikSpacing.zero : VerifikSpacing.sm,
                ),
                child: Image.network(
                  imageUrl,
                  width: VerifikResponsive.withSizeByContext(
                    context,
                    pixels: 100,
                  ),
                  height: VerifikResponsive.heightSizeByContext(
                    context,
                    pixels: size.width < 874 ? 80 : 124,
                  ),
                ),
              ),
              size.width > 600
                  ? Gap(
                      VerifikResponsive.heightSizeByContext(context,
                          pixels: VerifikSpacing.md),
                    )
                  : const SizedBox.shrink(),
              size.height > 650
                  ? VerifikText.body(
                      label: title,
                      fontWeight: FontWeight.w600,
                      color: VerifikColors.catalinaBlue.withOpacity(0.60),
                      textAlign: TextAlign.center,
                    )
                  : VerifikText.small(
                      label: title,
                      color: VerifikColors.catalinaBlue.withOpacity(0.60),
                      textAlign: TextAlign.center,
                    )
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
