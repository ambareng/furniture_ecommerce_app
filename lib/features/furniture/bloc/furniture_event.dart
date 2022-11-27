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

class FurnitureGetMyCartEvent extends FurnitureEvent {}

class FurnitureRemoveFromBookmarkEvent extends FurnitureEvent {
  final List<Furniture> furnitures;
  final int furnitureId;

  const FurnitureRemoveFromBookmarkEvent(
      {required this.furnitureId, required this.furnitures});

  @override
  List<Object> get props => [furnitureId, furnitures];
}

class FurnitureAddToCartEvent extends FurnitureEvent {
  final Furniture furniture;
  final int quantity;

  const FurnitureAddToCartEvent(
      {required this.furniture, required this.quantity});

  @override
  List<Object> get props => [furniture, quantity];
}
