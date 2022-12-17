import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:furniture_ecommerce_app/core/auth/repositories/auth_repo.dart';
import 'package:furniture_ecommerce_app/features/address/models/address.dart';
import 'package:furniture_ecommerce_app/features/address/repositories/address_repo.dart';
import 'package:http/http.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AuthRepo authRepo;
  final AddressRepo addressRepo;

  AddressBloc({required this.authRepo, required this.addressRepo})
      : super(
            const AddressState(status: AddressStatus.loading, addresses: [])) {
    on<GetAllAddressEvent>((event, emit) async {
      emit(state.copyWith(status: AddressStatus.loading));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final List<Address>? addresses =
            await addressRepo.getAllAddresses(accessToken: accessToken);
        if (addresses != null && addresses.isNotEmpty) {
          Address? selectedAddress;
          for (Address address in addresses) {
            if (address.is_default) {
              selectedAddress = address;
            }
          }
          emit(AddressState(
              status: AddressStatus.loaded,
              addresses: addresses,
              selectedAddress: selectedAddress));
        } else {
          emit(const AddressState(status: AddressStatus.loaded, addresses: []));
        }
      }
    });
    on<AddAddressEvent>((event, emit) async {
      emit(const AddressState(status: AddressStatus.adding, errors: null));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final Response res = await addressRepo.addAddress(
            accessToken: accessToken,
            addAddressPayload: event.addAddressPayload);
        if (res.statusCode == 201) {
          emit(const AddressState(status: AddressStatus.addSuccess));
        } else {
          try {
            final resJson = jsonDecode(res.body);
            emit(AddressState(status: AddressStatus.addError, errors: resJson));
          } catch (err) {
            emit(const AddressState(
                status: AddressStatus.addError,
                errors: {'non_field_errors': 'Something went wrong!'}));
          }
        }
      }
    });
    on<ToggleAddressDefaultEvent>((event, emit) async {
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final Response res = await addressRepo.toggleAddressDefault(
            accessToken: accessToken, addressId: event.addressId);
        if (res.statusCode == 200) {
          final List<dynamic> listResults = jsonDecode(res.body);
          final listAddresses = listResults.map((address) {
            return Address.fromJson(address);
          }).toList();
          Address? selectedAddress;
          for (Address address in listAddresses) {
            if (address.is_default) {
              selectedAddress = address;
            }
          }
          emit(AddressState(
              status: AddressStatus.loaded,
              addresses: listAddresses,
              selectedAddress: selectedAddress));
        } else {
          try {
            final resJson = jsonDecode(res.body);
            emit(AddressState(status: AddressStatus.addError, errors: resJson));
          } catch (err) {
            emit(const AddressState(
                status: AddressStatus.addError,
                errors: {'non_field_errors': 'Something went wrong!'}));
          }
        }
      }
    });
    on<GetAddressEvent>((event, emit) async {
      emit(state.copyWith(status: AddressStatus.loading, toEditAddress: null));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final Address? toEditAddress = await addressRepo.getAddressById(
            accessToken: accessToken, addressId: event.toEditAddressId);
        if (toEditAddress != null) {
          emit(state.copyWith(
              status: AddressStatus.loaded, toEditAddress: toEditAddress));
          return;
        }
      }
      emit(const AddressState(
          status: AddressStatus.addError,
          errors: {'non_field_errors': 'Something went wrong!'}));
    });
    on<EditAddressEvent>((event, emit) async {
      emit(state.copyWith(status: AddressStatus.adding));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final Address? editedAddress = await addressRepo.editAddress(
            accessToken: accessToken,
            editAddressPayload: event.editAddressPayload,
            addressId: event.addressId);
        if (editedAddress != null) {
          final List<Address>? oldAddresses = state.addresses;
          if (oldAddresses != null) {
            for (Address address in oldAddresses) {
              if (address.id == editedAddress.id) {
                address = address.copyWith(
                    label: editedAddress.label,
                    full_address: editedAddress.full_address,
                    country: editedAddress.country,
                    city: editedAddress.city,
                    region: editedAddress.region,
                    postal_code: editedAddress.postal_code);
              }
            }
          }
          emit(state.copyWith(
              status: AddressStatus.addSuccess,
              toEditAddress: null,
              addresses: oldAddresses));
        }
      }
    });
  }
}
