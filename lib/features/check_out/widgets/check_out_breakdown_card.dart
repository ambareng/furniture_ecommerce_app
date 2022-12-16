import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
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
        children: const [
          BreakdownItem(breakdownLabel: 'Order', breakdownPrice: 95.00),
          BreakdownItem(breakdownLabel: 'Delivery', breakdownPrice: 5.00),
          BreakdownItem(
            breakdownLabel: 'Total',
            breakdownPrice: 100.00,
            isHighlighted: true,
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
