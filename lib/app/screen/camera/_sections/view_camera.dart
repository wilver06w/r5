part of 'package:r5/app/screen/camera/page.dart';

class ViewCamera extends StatelessWidget {
  const ViewCamera({
    super.key,
    required this.state,
  });
  final BlocCameraState state;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: SizedBox(
            width: VerifikResponsive.withSizeByContext(
              context,
              pixels: 270,
            ),
            height: VerifikResponsive.heightSizeByContext(
              context,
              pixels: size.width > 600 ? 350 : 250,
            ),
            child: CameraPreview(
              state.model.cameraController!,
            ),
          ),
        ),
        Container(
          width: VerifikResponsive.withSizeByContext(
            context,
            pixels: 270,
          ),
          height: VerifikResponsive.heightSizeByContext(
            context,
            pixels: size.width > 600 ? 350 : 250,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(95),
            borderRadius: BorderRadius.circular(
              20.0,
            ),
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: VerifikResponsive.withSizeByContext(
                    context,
                    pixels: 120,
                  ),
                  height: VerifikResponsive.heightSizeByContext(
                    context,
                    pixels: 250,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                  ),
                ),
                Gap(
                  VerifikResponsive.heightSizeByContext(
                    context,
                    pixels: VerifikSpacing.md,
                  ),
                ),
                Button(
                  title: VerifikUiValues.takePhoto,
                  backgroundColor: VerifikColors.majorelleBlue,
                  onPressed: () {
                    context.read<BlocCamera>().add(
                          CaptureImageEvent(),
                        );

/*                    context.read<BlocDemo>().add(
                          const ChangePassNumberEvent(
                            passNumber: 3,
                          ),
                        );
 */
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
