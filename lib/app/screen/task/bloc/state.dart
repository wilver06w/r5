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

class ChangedDateState extends TaskState {
  const ChangedDateState(Model model) : super(model);
}

class ChangedCompleteState extends TaskState {
  const ChangedCompleteState(Model model) : super(model);
}

class ChangedDescriptionState extends TaskState {
  const ChangedDescriptionState(Model model) : super(model);
}

class ChangedTitleState extends TaskState {
  const ChangedTitleState(Model model) : super(model);
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
    this.date,
    this.isCompleted = true,
    this.description = '',
    this.title = '',
    this.numberPass = 0,
    this.documentDetails,
    this.liveness,
    this.compare,
    this.imageScanned,
    this.imageSelfie,
  });

  final DateTime? date;
  final bool isCompleted;
  final String description;
  final String title;

  final int numberPass;
  final DocumentDetails? documentDetails;
  final Liveness? liveness;
  final Compare? compare;
  final Uint8List? imageScanned;
  final Uint8List? imageSelfie;

  bool get isFormFilledTask =>
      (date != null) && (description.isNotEmpty) && (title.isNotEmpty);

  int get charactersDescription => description.length;

  Model copyWith({
    DateTime? date,
    bool? isCompleted,
    String? description,
    String? title,
    int? numberPass,
    Uint8List? imageScanned,
    Uint8List? imageSelfie,
    DocumentDetails? documentDetails,
    Liveness? liveness,
    Compare? compare,
  }) {
    return Model(
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
      description: description ?? this.description,
      title: title ?? this.title,
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
      isCompleted,
      description,
      title,
      numberPass,
      documentDetails,
      liveness,
      compare,
      imageScanned,
      imageSelfie,
    ];
  }
}
