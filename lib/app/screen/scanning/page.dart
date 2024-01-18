import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:octo_image/octo_image.dart';
import 'package:oktoast/oktoast.dart';
import 'package:r5/app/models/data_dialog.dart';
import 'package:r5/app/screen/demo/bloc/bloc.dart';
import 'package:r5/app/screen/demo/repository.dart';
import 'package:r5/app/utils/camera/bloc/bloc.dart';
import 'package:r5/app/utils/colors.dart';
import 'package:r5/app/utils/http/http_client.dart' hide ModularWatchExtension;
import 'package:r5/app/utils/responsive.dart';
import 'package:r5/app/utils/spacing.dart';
import 'package:r5/app/utils/text/text.dart';
import 'package:r5/app/utils/verifik_loading.dart';
import 'package:r5/app/widget/verifik_loading_circle.dart';
import 'package:r5/app/utils/verifik_ui.dart';
import 'package:r5/app/widget/body_general_two.dart';
import 'package:r5/app/widget/button.dart';

part 'package:r5/app/screen/scanning/_sections/item_id.dart';

class ScanningPage extends StatelessWidget {
  const ScanningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyGeneralTwo(
      bgColorRight: Colors.white,
      widgetLeft: ItemID(
        title: VerifikUiValues.uploadedIdDocument,
        imageUrl: VerifikUiValues.uploadImageTemp,
        titleButton: VerifikUiValues.uploadFile,
        onPressed: () async {
          var value = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider<BlocCamera>.value(
                    value: Modular.get<BlocCamera>(),
                  ),
                  BlocProvider(
                    create: (context) => BlocDemo(
                      repository: Repository(
                        verifikHttpClient: Modular.get<VerifikHttpClient>(),
                      ),
                    ),
                  ),
                ],
                child: const BlocListener<BlocDemo, DemoState>(
                  listener: _listener,
                  child: CustomDialog(),
                ),
              );
            },
          );

          if (value != null) {
            if (context.mounted) {
              final dataDialog = value as DataDialog;
              context.read<BlocDemo>().add(
                    ChangeInfoDetailEvent(
                      documentDetails: dataDialog.documentDetails,
                      imageScanned: dataDialog.imageMemory,
                    ),
                  );
              context.read<BlocDemo>().add(
                    const ChangePassNumberEvent(
                      passNumber: 2,
                    ),
                  );
            }
          }
        },
      ),
      widgetRight: ItemID(
        isBackgroundWhite: true,
        title: VerifikUiValues.scanIdDocument,
        imageUrl: VerifikUiValues.scanIdDocumentImage,
        titleButton: VerifikUiValues.startScanning,
        onPressed: () {
          showToast(
            VerifikUiValues.noPartFlow,
            backgroundColor: VerifikColors.rybBlue,
            textStyle: const TextStyle(
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}

Future<void> _listener(BuildContext context, DemoState state) async {
  if (state is LoadingDetailsState) {
    VerifikLoading.show(context);
  } else if (state is LoadedDetailState) {
    Navigator.pop(context);
    Navigator.pop(
      context,
      DataDialog(
        documentDetails: state.model.documentDetails!,
        imageMemory: context.read<BlocDemo>().state.model.imageScanned!,
      ),
    );
  } else if (state is ErrorDetailState) {
    Navigator.pop(context);

    if (state.message.isNotEmpty) {
      showToast(
        state.message,
        backgroundColor: VerifikColors.rybBlue,
        textStyle: const TextStyle(
          color: Colors.white,
        ),
      );
    }
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.15,
        vertical: size.height * 0.30,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 0.2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(VerifikSpacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(VerifikSpacing.xs),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: VerifikColors.rybBlue,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        BlocBuilder<BlocCamera, BlocCameraState>(
                          builder: (context, state) {
                            return (state.model.imagePath ?? '').isNotEmpty
                                ? (kIsWeb
                                    ? Image.memory(
                                        state.model.imageMemory!,
                                        height: 100,
                                        width: 100,
                                      )
                                    : OctoImage(
                                        image:
                                            FileImage(state.model.imageFile!),
                                        placeholderBuilder: (_) =>
                                            const VerifikLoadingCircle(),
                                      ))
                                : const SizedBox(
                                    height: 100,
                                    width: 100,
                                    child: Icon(
                                      Icons.upload_file,
                                    ),
                                  );
                          },
                        ),
                        Gap(
                          VerifikResponsive.withSizeByContext(
                            context,
                            pixels: 10,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            VerifikText.labelText(
                              label: VerifikUiValues.dragDropPhotoHere,
                              fontWeight: FontWeight.bold,
                            ),
                            VerifikText.small(
                              label: VerifikUiValues.idDocumentFile,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        context.read<BlocCamera>().add(
                              PickFileFromGalleryEvent(),
                            );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(
                          VerifikSpacing.xs,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: VerifikColors.rybBlue,
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.2,
                          ),
                        ),
                        child: VerifikText.body(
                          label: VerifikUiValues.findFileDevice,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Gap(
                      VerifikResponsive.heightSizeByContext(
                        context,
                        pixels: VerifikSpacing.sm,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(
                VerifikResponsive.heightSizeByContext(
                  context,
                  pixels: VerifikSpacing.sm,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button(
                    title: VerifikUiValues.cancel,
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    colorText: Colors.red,
                    backgroundColor: Colors.white,
                    borderColor: Colors.grey,
                  ),
                  Gap(
                    VerifikResponsive.withSizeByContext(
                      context,
                      pixels: VerifikSpacing.sm,
                    ),
                  ),
                  BlocBuilder<BlocCamera, BlocCameraState>(
                    builder: (context, state) {
                      return Button(
                        title: VerifikUiValues.continu,
                        backgroundColor: VerifikColors.majorelleBlue,
                        onPressed: (state.model.imagePath ?? '').isEmpty
                            ? null
                            : () {
                                context.read<BlocDemo>().add(
                                      GetDetailsEvent(
                                        imageScanned: context
                                            .read<BlocCamera>()
                                            .state
                                            .model
                                            .imageMemory!,
                                      ),
                                    );
                              },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
