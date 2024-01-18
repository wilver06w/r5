part of 'package:r5/app/screen/document/page.dart';

class InfoRight extends StatelessWidget {
  const InfoRight({
    super.key,
    required this.app,
  });

  final AppConfig app;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        horizontal: VerifikSpacing.md,
      ),
      children: [
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.xxl,
          ),
        ),
        BlocBuilder<BlocDemo, DemoState>(
          builder: (context, state) {
            return SectionInfo(
              title: VerifikUiValues.generalInformation,
              items: [
                ItemSection(
                  title: VerifikUiValues.device,
                  subTitle: app.infoDevice?.platform ?? '',
                ),
                ItemSection(
                  title: VerifikUiValues.lenguaje,
                  subTitle: app.infoDevice?.language ?? '',
                ),
                ItemSection(
                  title: VerifikUiValues.userAgent,
                  subTitle: app.infoDevice?.userAgent ?? '',
                ),
              ],
            );
          },
        ),
        BlocBuilder<BlocDemo, DemoState>(
          builder: (context, state) {
            return SectionInfo(
              title: VerifikUiValues.scanStudioDocumentExtraction,
              items: [
                ItemSection(
                  title: VerifikUiValues.documenType,
                  subTitle:
                      state.model.documentDetails?.data.studio.documentType ??
                          '',
                ),
                ItemSection(
                  title: VerifikUiValues.documentNumber,
                  subTitle: state.model.documentDetails?.data.studio
                          .ocrExtraction.documentNumber ??
                      '',
                ),
                ItemSection(
                  title: VerifikUiValues.firstName,
                  subTitle: state.model.documentDetails?.data.studio
                          .ocrExtraction.firstName ??
                      '',
                ),
                if ((state.model.documentDetails?.data.studio.ocrExtraction
                            .fullName ??
                        '')
                    .isNotEmpty) ...[
                  ItemSection(
                    title: VerifikUiValues.fullName,
                    subTitle: state.model.documentDetails?.data.studio
                            .ocrExtraction.fullName ??
                        '',
                  ),
                ],
              ],
            );
          },
        ),
        BlocBuilder<BlocDemo, DemoState>(
          builder: (context, state) {
            return SectionInfo(
              title: VerifikUiValues.scanPromptDocumentExtraction,
              items: [
                ItemSection(
                  title: VerifikUiValues.documenType,
                  subTitle:
                      state.model.documentDetails?.data.prompt.documentType ??
                          '',
                ),
                ItemSection(
                  title: VerifikUiValues.documentNumber,
                  subTitle: state.model.documentDetails?.data.prompt
                          .ocrExtraction.documentNumber ??
                      '',
                ),
                ItemSection(
                  title: VerifikUiValues.firstName,
                  subTitle: state.model.documentDetails?.data.prompt
                          .ocrExtraction.firstName ??
                      '',
                ),
                if ((state.model.documentDetails?.data.prompt.ocrExtraction
                            .fullName ??
                        '')
                    .isNotEmpty) ...[
                  ItemSection(
                    title: VerifikUiValues.fullName,
                    subTitle: state.model.documentDetails?.data.prompt
                            .ocrExtraction.fullName ??
                        '',
                  ),
                ],
              ],
            );
          },
        ),
        BlocBuilder<BlocDemo, DemoState>(
          builder: (context, state) {
            return const SectionInfo(
              title: VerifikUiValues.userEstimatedLocation,
              items: [],
            );
          },
        ),
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.md,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Button(
                title: VerifikUiValues.scanAgain,
                onPressed: () {
                  context.read<BlocDemo>().add(
                        const ChangePassNumberEvent(
                          passNumber: 1,
                        ),
                      );
                },
                colorText: VerifikColors.majorelleBlue,
                borderColor: VerifikColors.azureishWhite,
              ),
            ),
            Gap(
              VerifikResponsive.withSizeByContext(
                context,
                pixels: VerifikSpacing.md,
              ),
            ),
            Expanded(
              child: Button(
                title: VerifikUiValues.continu,
                backgroundColor: VerifikColors.majorelleBlue,
                onPressed: () {
                  context.read<BlocDemo>().add(
                        const ChangePassNumberEvent(
                          passNumber: 3,
                        ),
                      );
                },
              ),
            ),
          ],
        ),
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.md,
          ),
        ),
      ],
    );
  }
}
