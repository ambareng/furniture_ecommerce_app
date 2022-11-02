part of 'furniture_order_quantity_bloc.dart';

class FurnitureOrderQuantityState extends Equatable {
  final int quantity;

  const FurnitureOrderQuantityState({this.quantity = 1});

  @override
  List<Object> get props => [quantity];
}
