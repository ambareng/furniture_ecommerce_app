import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/check_out/widgets/check_out_address_card.dart';
import 'package:furniture_ecommerce_app/features/check_out/widgets/check_out_delivery_method_card.dart';
import 'package:furniture_ecommerce_app/features/check_out/widgets/check_out_payment_card.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

enum CheckOutCardType { address, payment, deliveryMethod }

class CheckOutCard extends StatelessWidget {
  final String title;
  final CheckOutCardType type;
  final String url;

  const CheckOutCard(
      {Key? key, required this.title, required this.type, required this.url})
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, url);
              },
              child: const Icon(
                Icons.edit_rounded,
                color: lightGray,
              ),
            )
          ],
        ),
        const Gap(10),
        if (type == CheckOutCardType.address) const CheckOutAddressCard(),
        if (type == CheckOutCardType.payment) const CheckOutPaymentCard(),
        if (type == CheckOutCardType.deliveryMethod)
          const CheckOutDeliveryMethodCard()
      ],
    );
  }
}
