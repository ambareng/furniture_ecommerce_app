part of 'delivery_methods_bloc.dart';

enum DeliveryMethodStatus { loaded, loading }

class DeliveryMethodsState extends Equatable {
  final DeliveryMethodStatus status;
  final List<DeliveryMethod>? deliveryMethods;
  final DeliveryMethod? selectedDeliveryMethod;

  const DeliveryMethodsState(
      {required this.status,
      this.deliveryMethods,
      this.selectedDeliveryMethod});

  @override
  List<Object?> get props => [status, deliveryMethods, selectedDeliveryMethod];

  DeliveryMethodsState copyWith({
    final DeliveryMethodStatus? status,
    final List<DeliveryMethod>? deliveryMethods,
    final DeliveryMethod? selectedDeliveryMethod,
  }) {
    return DeliveryMethodsState(
      status: status ?? this.status,
      deliveryMethods: deliveryMethods ?? this.deliveryMethods,
      selectedDeliveryMethod:
          selectedDeliveryMethod ?? this.selectedDeliveryMethod,
    );
  }
}
