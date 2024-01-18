part of 'bloc.dart';

abstract class DemoState extends Equatable {
  final Model model;
  const DemoState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends DemoState {
  const InitialState(Model model) : super(model);
}

class ChangedPassNumberState extends DemoState {
  const ChangedPassNumberState(Model model) : super(model);
}

class ChangedDocumentDetailoState extends DemoState {
  const ChangedDocumentDetailoState(Model model) : super(model);
}

class ChangedSelfieImageState extends DemoState {
  const ChangedSelfieImageState(Model model) : super(model);
}

class LoadingCompareRecognitionState extends DemoState {
  const LoadingCompareRecognitionState(Model model) : super(model);
}

class LoadedCompareRecognitionState extends DemoState {
  const LoadedCompareRecognitionState(Model model) : super(model);
}

class ErrorCompareRecognitionState extends DemoState {
  const ErrorCompareRecognitionState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingLivenessState extends DemoState {
  const LoadingLivenessState(Model model) : super(model);
}

class LoadedLivenessState extends DemoState {
  const LoadedLivenessState(Model model) : super(model);
}

class ErrorLivenessState extends DemoState {
  const ErrorLivenessState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingDetailsState extends DemoState {
  const LoadingDetailsState(Model model) : super(model);
}

class LoadedDetailState extends DemoState {
  const LoadedDetailState(Model model) : super(model);
}

class ErrorDetailState extends DemoState {
  const ErrorDetailState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class Model extends Equatable {
  const Model({
    this.numberPass = 0,
    this.documentDetails,
    this.liveness,
    this.compare,
    this.imageScanned,
    this.imageSelfie,
  });

  final int numberPass;
  final DocumentDetails? documentDetails;
  final Liveness? liveness;
  final Compare? compare;
  final Uint8List? imageScanned;
  final Uint8List? imageSelfie;

  Model copyWith({
    int? numberPass,
    Uint8List? imageScanned,
    Uint8List? imageSelfie,
    DocumentDetails? documentDetails,
    Liveness? liveness,
    Compare? compare,
  }) {
    return Model(
      numberPass: numberPass ?? this.numberPass,
      documentDetails: documentDetails ?? this.documentDetails,
      liveness: liveness ?? this.liveness,
      compare: compare ?? this.compare,
      imageScanned: imageScanned ?? this.imageScanned,
      imageSelfie: imageSelfie ?? this.imageSelfie,
    );
  }

  @override
  List<Object?> get props {
    return [
      numberPass,
      documentDetails,
      liveness,
      compare,
      imageScanned,
      imageSelfie,
    ];
  }
}
