part of 'bloc.dart';

abstract class DemoEvent extends Equatable {
  const DemoEvent();

  @override
  List<Object> get props => [];
}

class ChangePassNumberEvent extends DemoEvent {
  const ChangePassNumberEvent({
    required this.passNumber,
  });

  final int passNumber;
}

class GetCompareRecognitionEvent extends DemoEvent {}

class GetLivenessDataEvent extends DemoEvent {}

class ChangeSelfieImagenEvent extends DemoEvent {
  const ChangeSelfieImagenEvent({
    required this.imageSelfie,
  });

  final Uint8List imageSelfie;
}

class ChangeInfoDetailEvent extends DemoEvent {
  const ChangeInfoDetailEvent({
    required this.documentDetails,
    required this.imageScanned,
  });

  final Uint8List imageScanned;
  final DocumentDetails documentDetails;
}

class GetDetailsEvent extends DemoEvent {
  const GetDetailsEvent({
    required this.imageScanned,
  });
  final Uint8List imageScanned;
}