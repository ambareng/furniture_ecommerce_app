import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutPaymentCard extends StatelessWidget {
  const CheckOutPaymentCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        children: [
          Container(
            width: 64,
            height: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: lighterGray.withOpacity(0.05),
                    spreadRadius: 5,
                    blurRadius: 7,
                  )
                ]),
            child:
                Image.asset('assets/images/credit_card_logos/mastercard.png'),
          ),
          const Gap(20),
          Text(
            '**** **** **** 3947',
            style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 14, color: black)),
          )
        ],
      ),
    );
  }
}
