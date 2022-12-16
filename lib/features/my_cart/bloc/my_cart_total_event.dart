part of 'my_cart_total_bloc.dart';

abstract class MyCartTotalEvent extends Equatable {
  const MyCartTotalEvent();

  @override
  List<Object> get props => [];
}

class GetMyCartTotalEvent extends MyCartTotalEvent {}
