part of 'bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class ChangeDateEvent extends TaskEvent {
  const ChangeDateEvent({
    required this.date,
  });

  final DateTime date;
}

class ChangeCompletedEvent extends TaskEvent {
  const ChangeCompletedEvent({
    required this.complete,
  });

  final bool complete;
}

class ChangeDescriptionEvent extends TaskEvent {
  const ChangeDescriptionEvent({
    required this.description,
  });

  final String description;
}

class ChangeTitleEvent extends TaskEvent {
  const ChangeTitleEvent({
    required this.title,
  });

  final String title;
}

class ChangePassNumberEvent extends TaskEvent {
  const ChangePassNumberEvent({
    required this.passNumber,
  });

  final int passNumber;
}

class GetCompareRecognitionEvent extends TaskEvent {}

class GetLivenessDataEvent extends TaskEvent {}

class ChangeSelfieImagenEvent extends TaskEvent {
  const ChangeSelfieImagenEvent({
    required this.imageSelfie,
  });

  final Uint8List imageSelfie;
}

class ChangeInfoDetailEvent extends TaskEvent {
  const ChangeInfoDetailEvent({
    required this.documentDetails,
    required this.imageScanned,
  });

  final Uint8List imageScanned;
  final DocumentDetails documentDetails;
}

class GetDetailsEvent extends TaskEvent {
  const GetDetailsEvent({
    required this.imageScanned,
  });
  final Uint8List imageScanned;
}
