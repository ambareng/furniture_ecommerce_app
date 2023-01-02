import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/delivery_methods/bloc/delivery_methods_bloc.dart';
import 'package:furniture_ecommerce_app/features/my_cart/bloc/my_cart_total_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutBreakdownCard extends StatelessWidget {
  const CheckOutBreakdownCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 69,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
        children: [
          BlocBuilder<MyCartTotalBloc, MyCartTotalState>(
            builder: (context, state) {
              return BreakdownItem(
                  breakdownLabel: 'Order', breakdownPrice: state.total ?? 0.00);
            },
          ),
          BlocBuilder<DeliveryMethodsBloc, DeliveryMethodsState>(
            builder: (context, state) {
              return BreakdownItem(
                  breakdownLabel: 'Delivery',
                  breakdownPrice: state.selectedDeliveryMethod != null
                      ? state.selectedDeliveryMethod!.price
                      : 0.00);
            },
          ),
          BlocBuilder<DeliveryMethodsBloc, DeliveryMethodsState>(
            builder: (context, deliveryMethodState) {
              return BlocBuilder<MyCartTotalBloc, MyCartTotalState>(
                builder: (context, myCartState) {
                  return BreakdownItem(
                    breakdownLabel: 'Total',
                    breakdownPrice:
                        deliveryMethodState.selectedDeliveryMethod != null &&
                                myCartState.total != null
                            ? deliveryMethodState
                                    .selectedDeliveryMethod!.price +
                                myCartState.total!
                            : 0.00,
                    isHighlighted: true,
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class BreakdownItem extends StatelessWidget {
  final String breakdownLabel;
  final double breakdownPrice;
  final bool isHighlighted;

  const BreakdownItem(
      {Key? key,
      required this.breakdownLabel,
      required this.breakdownPrice,
      this.isHighlighted = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$breakdownLabel:',
            style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: lightGray)),
          ),
          Text(
            '\$ $breakdownPrice',
            style: GoogleFonts.nunitoSans(
                textStyle: TextStyle(
                    fontWeight:
                        isHighlighted ? FontWeight.w700 : FontWeight.w600,
                    fontSize: 18,
                    color: bgBlack)),
          )
        ],
      ),
    );
  }
}
