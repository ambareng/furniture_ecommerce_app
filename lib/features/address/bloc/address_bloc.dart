import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/auth/repositories/auth_repo.dart';
import 'package:furniture_ecommerce_app/features/address/models/address.dart';
import 'package:furniture_ecommerce_app/features/address/repositories/address_repo.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AuthRepo authRepo;
  final AddressRepo addressRepo;

  AddressBloc({required this.authRepo, required this.addressRepo})
      : super(
            const AddressState(status: AddressStatus.loading, addresses: [])) {
    on<GetAllAddressEvent>((event, emit) async {
      emit(const AddressState(status: AddressStatus.loading, addresses: []));
      final String? accessToken = await authRepo.getAccessToken();
      if (accessToken != null) {
        final List<Address>? addresses =
            await addressRepo.getAllAddresses(accessToken: accessToken);
        if (addresses != null && addresses.isNotEmpty) {
          return;
        } else {
          emit(const AddressState(status: AddressStatus.loaded, addresses: []));
        }
      }
    });
  }
}
