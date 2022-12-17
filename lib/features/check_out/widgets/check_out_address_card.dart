import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/address/bloc/address_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutAddressCard extends StatelessWidget {
  const CheckOutAddressCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AddressBloc>(context).add(GetAllAddressEvent());

    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        return Container(
            width: double.infinity,
            height: 127,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: lighterGray.withOpacity(0.025),
                    spreadRadius: 5,
                    blurRadius: 7,
                  )
                ]),
            child: state.status == AddressStatus.loading
                ? const LoadingWidget()
                : state.status == AddressStatus.loaded &&
                        state.selectedAddress == null
                    ? const NoAddress()
                    : const SelectedAddressDetails());
      },
    );
  }
}

class NoAddress extends StatelessWidget {
  const NoAddress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No address',
        style: GoogleFonts.nunitoSans(
            textStyle:
                const TextStyle(color: black, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: black,
        strokeWidth: 1.0,
      ),
    );
  }
}

class SelectedAddressDetails extends StatelessWidget {
  const SelectedAddressDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 5),
              child: Text(
                state.selectedAddress!.label,
                style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: black)),
              ),
            ),
            Divider(
              color: Colors.grey[100],
              thickness: 2,
            ),
            Padding(
                padding: const EdgeInsets.only(
                    top: 5, left: 15, right: 15, bottom: 5),
                child: Text(
                  state.selectedAddress!.full_address,
                  style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: lightGray)),
                ))
          ],
        );
      },
    );
  }
}
