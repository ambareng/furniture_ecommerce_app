part of 'address_bloc.dart';

enum AddressStatus { loaded, loading }

class AddressState extends Equatable {
  final AddressStatus status;
  final List<Address>? addresses;
  final Address? selectedAddress;

  const AddressState(
      {required this.status, this.addresses, this.selectedAddress});

  @override
  List<Object> get props => [status];
}
