part of 'bloc.dart';

abstract class EventCamera extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadEvent extends EventCamera {}

class ProcessImageEvent extends EventCamera {
  final File file;
  final double ratio;

  ProcessImageEvent({
    required this.file,
    this.ratio = 1.0,
  });

  @override
  List<Object> get props => [
        ...super.props,
        file,
        ratio,
      ];
}

class CaptureImageEvent extends EventCamera {
  final int maxFileSizeBytes;

  bool get shouldProcessImage => maxFileSizeBytes > 0;

  CaptureImageEvent({this.maxFileSizeBytes = 0});
}

class PickFileFromGalleryEvent extends EventCamera {
  final int maxFileSizeBytes;

  bool get shouldProcessImage => maxFileSizeBytes > 0;

  PickFileFromGalleryEvent({this.maxFileSizeBytes = 0});
}

class ClearCaptureEvent extends EventCamera {}
