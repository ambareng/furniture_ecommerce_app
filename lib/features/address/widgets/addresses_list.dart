import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/address/bloc/address_bloc.dart';
import 'package:furniture_ecommerce_app/features/address/models/address.dart';
import 'package:google_fonts/google_fonts.dart';

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
        if (state.addresses != null && state.addresses!.isNotEmpty) {
          return BlocBuilder<AddressBloc, AddressState>(
            builder: (context, state) {
              return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: state.addresses!.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: AddressItem(
                        address: state.addresses![index],
                      ),
                    );
                  }));
            },
          );
        }
        return Container();
      },
    );
  }
}

class AddressItem extends StatelessWidget {
  final Address address;

  const AddressItem({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 1.15,
                  child: Theme(
                    data: ThemeData(unselectedWidgetColor: lighterGray),
                    child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        value: address.is_default,
                        activeColor: bgBlack,
                        onChanged: (bool? value) {
                          BlocProvider.of<AddressBloc>(context).add(
                              ToggleAddressDefaultEvent(addressId: address.id));
                        }),
                  ),
                ),
                Text(
                  'Use as the shipping address',
                  style: GoogleFonts.nunitoSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: address.is_default ? bgBlack : lighterGray)),
                )
              ],
            ),
            AddressItemCard(address: address),
          ],
        );
      },
    );
  }
}

class AddressItemCard extends StatelessWidget {
  final Address address;

  const AddressItemCard({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  address.label,
                  style: GoogleFonts.nunitoSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: black)),
                ),
                BlocBuilder<AddressBloc, AddressState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<AddressBloc>(context)
                            .add(GetAddressEvent(toEditAddressId: address.id));
                        Navigator.pushNamed(context, '/address/edit');
                      },
                      child: const Icon(
                        Icons.edit_rounded,
                        size: 20,
                        color: bgBlack,
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey[100],
            thickness: 2,
          ),
          Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
              child: Text(
                address.full_address,
                style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: lightGray)),
              ))
        ],
      ),
    );
  }
}
