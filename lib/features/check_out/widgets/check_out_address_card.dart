import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutAddressCard extends StatelessWidget {
  const CheckOutAddressCard({Key? key}) : super(key: key);

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
            child: Text(
              'Home',
              style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18, color: black)),
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
                '#16 Quiling Sur, Batac City, Ilocos Norte, Philippines, 2906',
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
