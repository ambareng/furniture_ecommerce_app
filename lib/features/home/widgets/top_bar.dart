import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/images/home/search_icon.svg'),
          Column(
            children: [
              Text(
                'Make home',
                style: GoogleFonts.gelasio(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: lighterGray)),
              ),
              Text(
                'BEAUTIFUL',
                style: GoogleFonts.gelasio(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: bgBlack)),
              ),
            ],
          ),
          SvgPicture.asset('assets/images/home/cart_icon.svg'),
        ],
      ),
    );
  }
}
