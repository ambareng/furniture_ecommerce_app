part of 'address_bloc.dart';

enum AddressStatus { loaded, loading, adding, addSuccess, addError }

class AddressState extends Equatable {
  final AddressStatus status;
  final List<Address>? addresses;
  final Address? selectedAddress;
  final Map<String, dynamic>? errors;
  final int? toEditAddressId;

  const AddressState(
      {required this.status,
      this.addresses,
      this.selectedAddress,
      this.errors,
      this.toEditAddressId});

  @override
  List<Object?> get props => [status, addresses, selectedAddress, errors];

  AddressState copyWith({
    final AddressStatus? status,
    final List<Address>? addresses,
    final Address? selectedAddress,
    final Map<String, dynamic>? errors,
    final int? toEditAddressId,
  }) {
    return AddressState(
      status: status ?? this.status,
      addresses: addresses ?? this.addresses,
      selectedAddress: selectedAddress ?? this.selectedAddress,
      errors: errors ?? this.errors,
      toEditAddressId: toEditAddressId ?? this.toEditAddressId,
    );
  }
}
