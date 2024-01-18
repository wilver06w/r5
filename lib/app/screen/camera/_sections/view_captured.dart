part of 'package:r5/app/screen/camera/page.dart';

class ViewImageCaptured extends StatelessWidget {
  const ViewImageCaptured({
    super.key,
    required this.state,
  });
  final BlocCameraState state;

  @override
  Widget build(BuildContext context) {
    return state.model.selfieImageMemory != null
        ? Image.memory(
            state.model.selfieImageMemory!,
            width: VerifikResponsive.withSizeByContext(
              context,
              pixels: 270,
            ),
            height: VerifikResponsive.heightSizeByContext(
              context,
              pixels: 400,
            ),
          )
        : OctoImage(
            width: VerifikResponsive.withSizeByContext(
              context,
              pixels: 310,
            ),
            height: VerifikResponsive.heightSizeByContext(
              context,
              pixels: 120,
            ),
            image: FileImage(state.model.selfieImageFile!),
            placeholderBuilder: (_) => const VerifikLoadingCircle(),
          );
  }
}
