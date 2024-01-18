part of 'bloc.dart';

abstract class HomeState extends Equatable {
  final Model model;
  const HomeState(this.model);

  @override
  List<Object?> get props => [model];
}

class InitialState extends HomeState {
  const InitialState(Model model) : super(model);
}

class LoadingDeleteItemState extends HomeState {
  const LoadingDeleteItemState(Model model) : super(model);
}

class LoadedDeletedItemState extends HomeState {
  const LoadedDeletedItemState(Model model) : super(model);
}

class ErrorDeleteItemState extends HomeState {
  const ErrorDeleteItemState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class LoadingLogoutState extends HomeState {
  const LoadingLogoutState(Model model) : super(model);
}

class LoadedLogoutState extends HomeState {
  const LoadedLogoutState(Model model) : super(model);
}

class ErrorLogoutState extends HomeState {
  const ErrorLogoutState({
    required Model model,
    this.message = '',
  }) : super(model);

  final String message;
}

class Model extends Equatable {
  const Model();

  Model copyWith() {
    return const Model();
  }

  @override
  List<Object?> get props {
    return [];
  }
}
