part of 'bloc.dart';

abstract class TaskState extends Equatable {
  final Model model;
  const TaskState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends TaskState {
  const InitialState(Model model) : super(model);
}

class ChangedPassNumberState extends TaskState {
  const ChangedPassNumberState(Model model) : super(model);
}

class ChangedDocumentDetailoState extends TaskState {
  const ChangedDocumentDetailoState(Model model) : super(model);
}

class ChangedSelfieImageState extends TaskState {
  const ChangedSelfieImageState(Model model) : super(model);
}

class LoadingCompareRecognitionState extends TaskState {
  const LoadingCompareRecognitionState(Model model) : super(model);
}

class LoadedCompareRecognitionState extends TaskState {
  const LoadedCompareRecognitionState(Model model) : super(model);
}

class ErrorCompareRecognitionState extends TaskState {
  const ErrorCompareRecognitionState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingLivenessState extends TaskState {
  const LoadingLivenessState(Model model) : super(model);
}

class LoadedLivenessState extends TaskState {
  const LoadedLivenessState(Model model) : super(model);
}

class ErrorLivenessState extends TaskState {
  const ErrorLivenessState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingDetailsState extends TaskState {
  const LoadingDetailsState(Model model) : super(model);
}

class LoadedDetailState extends TaskState {
  const LoadedDetailState(Model model) : super(model);
}

class ErrorDetailState extends TaskState {
  const ErrorDetailState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class Model extends Equatable {
  const Model({
    this.date = '',
    this.numberPass = 0,
    this.documentDetails,
    this.liveness,
    this.compare,
    this.imageScanned,
    this.imageSelfie,
  });

  final String date;

  final int numberPass;
  final DocumentDetails? documentDetails;
  final Liveness? liveness;
  final Compare? compare;
  final Uint8List? imageScanned;
  final Uint8List? imageSelfie;

  Model copyWith({
    String? date,
    int? numberPass,
    Uint8List? imageScanned,
    Uint8List? imageSelfie,
    DocumentDetails? documentDetails,
    Liveness? liveness,
    Compare? compare,
  }) {
    return Model(
      date: date ?? this.date,
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
      date,
      numberPass,
      documentDetails,
      liveness,
      compare,
      imageScanned,
      imageSelfie,
    ];
  }
}
