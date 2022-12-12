import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/check_out/widgets/check_out_address_card.dart';
import 'package:furniture_ecommerce_app/features/check_out/widgets/check_out_payment_card.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

enum CheckOutCardType { address, payment }

class CheckOutCard extends StatelessWidget {
  final String title;
  final CheckOutCardType type;

  const CheckOutCard({Key? key, required this.title, required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: GoogleFonts.nunitoSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: lighterGray)),
            ),
            const Icon(
              Icons.edit_rounded,
              color: black,
            )
          ],
        ),
        const Gap(10),
        if (type == CheckOutCardType.address) const CheckOutAddressCard(),
        if (type == CheckOutCardType.payment) const CheckOutPaymentCard()
      ],
    );
  }
}
