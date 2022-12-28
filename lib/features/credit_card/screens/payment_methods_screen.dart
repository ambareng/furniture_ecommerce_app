import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/back_icon.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/credit_card/widgets/payment_methods_list.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/top_bar.dart';
import 'package:gap/gap.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 50.0),
        child: FloatingActionButton(
          onPressed: () {
            // Navigator.pushNamed(context, '/address/add');
          },
          backgroundColor: Colors.white,
          foregroundColor: black,
          child: const Icon(Icons.add_rounded),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: const [
              Gap(60),
              TopBar(
                bottomHeader: 'Payment methods',
                leftIcon: BackIconButton(),
              ),
              Gap(25),
              PaymentMethodsList()
            ],
          ),
        ),
      ),
    );
  }
}
