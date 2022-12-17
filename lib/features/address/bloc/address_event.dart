part of 'address_bloc.dart';

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class GetAllAddressEvent extends AddressEvent {}

class AddAddressEvent extends AddressEvent {
  final Map<String, dynamic> addAddressPayload;

  const AddAddressEvent({required this.addAddressPayload});

  @override
  List<Object> get props => [];
}

class ToggleAddressDefaultEvent extends AddressEvent {
  final int addressId;

  const ToggleAddressDefaultEvent({required this.addressId});

  @override
  List<Object> get props => [addressId];
}
