part of 'package:r5/app/screen/result/page.dart';

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
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ItemPercent(
                  title: VerifikUiValues.livenessScore,
                  percent:
                      state.model.liveness?.data.result.livenessScore ?? 0.0,
                  colorsProgress: VerifikColors.rybBlue,
                ),
                Gap(
                  VerifikResponsive.withSizeByContext(
                    context,
                    pixels: VerifikSpacing.xs,
                  ),
                ),
                ItemPercent(
                  title: VerifikUiValues.matchScore,
                  percent: state.model.compare?.data.result.score ?? 0.0,
                  colorsProgress: VerifikColors.maximumRed,
                ),
              ],
            );
          },
        ),
        Gap(
          VerifikResponsive.heightSizeByContext(
            context,
            pixels: VerifikSpacing.xl,
          ),
        ),
        BlocBuilder<BlocDemo, DemoState>(
          builder: (context, state) {
            return SectionInfo(
              title: VerifikUiValues.livenessMatchResults,
              items: [
                ItemSection(
                  title: VerifikUiValues.livenessScore,
                  subTitle:
                      '${Functions.convertirAInt(value: state.model.liveness?.data.result.livenessScore ?? 0.0)}',
                ),
                ItemSection(
                  title: VerifikUiValues.livenessPassed,
                  subTitle:
                      '${(state.model.liveness?.data.result.passed ?? false)}',
                ),
                ItemSection(
                  title: VerifikUiValues.minimumLivenessScore,
                  subTitle:
                      '${Functions.convertirAInt(value: state.model.liveness?.data.livenessMinScore ?? 0.0)}',
                ),
                ItemSection(
                  title: VerifikUiValues.matchScore,
                  subTitle:
                      '${Functions.convertirAInt(value: state.model.compare?.data.result.score ?? 0.0)}',
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
        Column(
          children: [
            Button(
              title: VerifikUiValues.restartDemo,
              backgroundColor: VerifikColors.majorelleBlue,
              onPressed: () {
                context.read<BlocDemo>().add(
                      const ChangePassNumberEvent(
                        passNumber: 0,
                      ),
                    );
              },
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
