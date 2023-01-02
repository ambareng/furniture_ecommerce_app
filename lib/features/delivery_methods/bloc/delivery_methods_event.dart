part of 'delivery_methods_bloc.dart';

abstract class DeliveryMethodsEvent extends Equatable {
  const DeliveryMethodsEvent();

  @override
  List<Object> get props => [];
}

class GetAllDeliveryMethodsEvent extends DeliveryMethodsEvent {}

class SelectDeliveryMethodEvent extends DeliveryMethodsEvent {
  final DeliveryMethod selectedDeliveryMethod;

  const SelectDeliveryMethodEvent({required this.selectedDeliveryMethod});

  @override
  List<Object> get props => [selectedDeliveryMethod];
}
