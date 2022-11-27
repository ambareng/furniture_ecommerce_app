import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/back_icon.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/top_bar.dart';
import 'package:furniture_ecommerce_app/features/my_cart/screens/widgets/my_cart_item_list.dart';
import 'package:gap/gap.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({Key? key}) : super(key: key);

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
                bottomHeader: 'My cart',
                leftIcon: BackIconButton(),
              ),
              MyCartItemList()
            ],
          ),
        ),
      ),
    );
  }
}
