import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/delivery_methods/bloc/delivery_methods_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutDeliveryMethodCard extends StatelessWidget {
  const CheckOutDeliveryMethodCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DeliveryMethodsBloc>(context)
        .add(GetAllDeliveryMethodsEvent());

    return Container(
      width: double.infinity,
      height: 69,
      padding: const EdgeInsets.symmetric(horizontal: 25),
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
      child: BlocBuilder<DeliveryMethodsBloc, DeliveryMethodsState>(
        builder: (context, state) {
          return Row(
            children: [
              Image.asset('assets/images/delivery_method_logos/dhl.png',
                  width: 100),
              const Gap(20),
              Text(
                state.selectedDeliveryMethod != null
                    ? state.selectedDeliveryMethod!.name
                    : '',
                style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: bgBlack)),
              )
            ],
          );
        },
      ),
    );
  }
}
