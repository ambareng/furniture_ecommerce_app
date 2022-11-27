import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class PromoCodeInput extends StatelessWidget {
  const PromoCodeInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        height: 44,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.035),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Enter your promo code',
              border: InputBorder.none,
              hintStyle: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xFF999999)))),
        ),
      ),
      Positioned(
        right: 0,
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
                color: black, borderRadius: BorderRadius.circular(10)),
            child: const Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.white),
          ),
        ),
      )
    ]);
  }
}
