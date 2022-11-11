part of 'furniture_bloc.dart';

abstract class FurnitureEvent extends Equatable {
  const FurnitureEvent();

  @override
  List<Object> get props => [];
}

class FurnitureSelectedEvent extends FurnitureEvent {
  final Furniture furniture;

  const FurnitureSelectedEvent({required this.furniture});

  @override
  List<Object> get props => [furniture];
}

class FurnitureToggleBookmarkEvent extends FurnitureEvent {
  final Furniture furniture;

  const FurnitureToggleBookmarkEvent({required this.furniture});

  @override
  List<Object> get props => [furniture];
}

class FurnitureGetBookmarkedEvent extends FurnitureEvent {}
