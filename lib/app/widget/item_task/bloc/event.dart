part of 'bloc.dart';

abstract class ItemTaskEvent extends Equatable {
  const ItemTaskEvent();

  @override
  List<Object> get props => [];
}

class ChangeIsViewTraslateEvent extends ItemTaskEvent {}
