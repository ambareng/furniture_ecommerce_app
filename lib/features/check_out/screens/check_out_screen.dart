import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/back_icon.dart';
import 'package:furniture_ecommerce_app/features/check_out/widgets/check_out_card.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/top_bar.dart';
import 'package:gap/gap.dart';

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
            children: const [
              Gap(60),
              TopBar(
                bottomHeader: 'Check out',
                leftIcon: BackIconButton(),
              ),
              Gap(25),
              CheckOutCard(
                title: 'Shipping Address',
                type: CheckOutCardType.address,
              )
            ],
          ),
        ),
      ),
    );
  }
}
