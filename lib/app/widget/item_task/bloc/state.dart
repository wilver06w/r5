part of 'bloc.dart';

abstract class ItemTaskState extends Equatable {
  final Model model;
  const ItemTaskState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends ItemTaskState {
  const InitialState(Model model) : super(model);
}

class ChangeIsViewTraslateState extends ItemTaskState {
  const ChangeIsViewTraslateState(Model model) : super(model);
}

class Model extends Equatable {
  const Model({
    required this.task,
    this.isViewTraslate = true,
  });

  final Task task;
  final bool isViewTraslate;

  Model copyWith({
    Task? task,
    bool? isViewTraslate,
  }) {
    return Model(
      task: task ?? this.task,
      isViewTraslate: isViewTraslate ?? this.isViewTraslate,
    );
  }

  @override
  List<Object?> get props {
    return [
      task,
      isViewTraslate,
    ];
  }
}
