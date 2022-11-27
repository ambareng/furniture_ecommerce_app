import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/invisible_icon.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBar extends StatelessWidget {
  final String? topHeader;
  final String bottomHeader;
  final Widget? leftIcon;
  final Widget? rightIcon;

  const TopBar(
      {Key? key,
      this.topHeader,
      required this.bottomHeader,
      this.leftIcon,
      this.rightIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SvgPicture.asset('assets/images/home/search_icon.svg'),
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.search_outlined),
          //   color: lightGray,
          // ),
          leftIcon ?? const InvisibleIconButton(),
          Column(
            children: [
              topHeader != null
                  ? Text(
                      topHeader!,
                      style: GoogleFonts.gelasio(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: lighterGray)),
                    )
                  : Container(),
              Text(
                bottomHeader,
                style: GoogleFonts.gelasio(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: bgBlack)),
              ),
            ],
          ),
          // SvgPicture.asset('assets/images/home/cart_icon.svg'),
          // Badge(
          //   badgeContent: Text(
          //     '99',
          //     style: GoogleFonts.nunitoSans(
          //         textStyle: const TextStyle(fontSize: 9, color: Colors.white)),
          //   ),
          //   badgeColor: Colors.red[300]!,
          //   child: const Icon(
          //     Icons.shopping_cart_outlined,
          //     color: lightGray,
          //   ),
          // )
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.shopping_cart_outlined,
          //   ),
          //   color: lightGray,
          // ),
          rightIcon ?? const InvisibleIconButton(),
        ],
      ),
    );
  }
}
