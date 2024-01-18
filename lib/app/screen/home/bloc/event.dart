part of 'bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class DeleteItemTaskEvent extends HomeEvent {
  const DeleteItemTaskEvent({
    required this.id,
  });

  final String id;
}
