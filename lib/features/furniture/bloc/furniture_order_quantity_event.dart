part of 'furniture_order_quantity_bloc.dart';

abstract class FurnitureOrderQuantityEvent extends Equatable {
  const FurnitureOrderQuantityEvent();

  @override
  List<Object> get props => [];
}

class FurnitureOrderQuantityResetEvent extends FurnitureOrderQuantityEvent {}

class FurnitureOrderQuantityAddEvent extends FurnitureOrderQuantityEvent {
  final int currentQuantity;

  const FurnitureOrderQuantityAddEvent({this.currentQuantity = 1});

  @override
  List<Object> get props => [currentQuantity];
}

class FurnitureOrderQuantityRemoveEvent extends FurnitureOrderQuantityEvent {
  final int currentQuantity;

  const FurnitureOrderQuantityRemoveEvent({this.currentQuantity = 1});

  @override
  List<Object> get props => [currentQuantity];
}
