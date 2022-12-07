part of 'my_cart_total_bloc.dart';

enum MyCartTotalStatus { loading, loaded }

class MyCartTotalState extends Equatable {
  final MyCartTotalStatus status;
  final double? total;

  const MyCartTotalState({this.total, required this.status});

  @override
  List<Object?> get props => [total, status];
}
