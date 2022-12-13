import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/back_icon.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/check_out/widgets/check_out_breakdown_card.dart';
import 'package:furniture_ecommerce_app/features/check_out/widgets/check_out_card.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/top_bar.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Gap(60),
              const TopBar(
                bottomHeader: 'Check out',
                leftIcon: BackIconButton(),
              ),
              const Gap(25),
              const CheckOutCard(
                title: 'Shipping Address',
                type: CheckOutCardType.address,
              ),
              const Gap(25),
              const CheckOutCard(
                title: 'Payment',
                type: CheckOutCardType.payment,
              ),
              const Gap(25),
              const CheckOutCard(
                title: 'Delivery method',
                type: CheckOutCardType.deliveryMethod,
              ),
              const Gap(25),
              const CheckOutBreakdownCard(),
              const Gap(25),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'SUBMIT ORDER',
                      style: GoogleFonts.nunitoSans(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.white)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
