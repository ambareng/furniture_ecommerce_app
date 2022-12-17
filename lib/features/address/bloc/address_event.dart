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
  List<Object> get props => [addAddressPayload];
}

class ToggleAddressDefaultEvent extends AddressEvent {
  final int addressId;

  const ToggleAddressDefaultEvent({required this.addressId});

  @override
  List<Object> get props => [addressId];
}

class GetAddressEvent extends AddressEvent {
  final int toEditAddressId;

  const GetAddressEvent({required this.toEditAddressId});

  @override
  List<Object> get props => [toEditAddressId];
}

class EditAddressEvent extends AddressEvent {
  final Map<String, dynamic> editAddressPayload;
  final int addressId;

  const EditAddressEvent(
      {required this.editAddressPayload, required this.addressId});

  @override
  List<Object> get props => [editAddressPayload, addressId];
}
