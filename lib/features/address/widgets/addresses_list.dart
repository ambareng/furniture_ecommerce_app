import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/address/bloc/address_bloc.dart';

class AddressesList extends StatelessWidget {
  const AddressesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AddressBloc>(context).add(GetAllAddressEvent());

    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        if (state.status == AddressStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: black,
              strokeWidth: 1.0,
            ),
          );
        }
        if (state.status == AddressStatus.loaded &&
            state.addresses != null &&
            state.addresses!.isEmpty) {
          return const Expanded(
              child: Padding(
            padding: EdgeInsets.only(bottom: 100.0),
            child: Center(child: Text('No addresses')),
          ));
        }
        return Container();
      },
    );
  }
}
