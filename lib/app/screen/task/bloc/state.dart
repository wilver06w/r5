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

class ChangedValidateTaskDateState extends TaskState {
  const ChangedValidateTaskDateState(Model model) : super(model);
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

class LoadingSaveTaskState extends TaskState {
  const LoadingSaveTaskState(Model model) : super(model);
}

class LoadedSaveTaskState extends TaskState {
  const LoadedSaveTaskState(Model model) : super(model);
}

class ErrorSaveTaskState extends TaskState {
  const ErrorSaveTaskState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class Model extends Equatable {
  const Model({
    this.id = '',
    this.date,
    this.isCompleted = false,
    this.description = '',
    this.title = '',
  });

  final DateTime? date;
  final bool isCompleted;
  final String description;
  final String title;
  final String id;

  bool get isFormFilledTask =>
      (date != null) && (description.isNotEmpty) && (title.isNotEmpty);

  int get charactersDescription => description.length;

  bool get isEdit => id.isNotEmpty;

  Model copyWith({
    DateTime? date,
    bool? isCompleted,
    String? id,
    String? description,
    String? title,
  }) {
    return Model(
      date: date ?? this.date,
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
      description: description ?? this.description,
      title: title ?? this.title,
    );
  }

  @override
  List<Object?> get props {
    return [
      date,
      id,
      isCompleted,
      description,
      title,
    ];
  }
}
