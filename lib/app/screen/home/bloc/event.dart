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

class SaveTaskEvent extends TaskEvent {}
