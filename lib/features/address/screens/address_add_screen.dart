import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/back_icon.dart';
import 'package:furniture_ecommerce_app/features/address/widgets/address_add_fields.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/top_bar.dart';
import 'package:gap/gap.dart';

class AddressAddScreen extends StatelessWidget {
  const AddressAddScreen({Key? key}) : super(key: key);

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
                bottomHeader: 'Add shipping address',
                leftIcon: BackIconButton(),
              ),
              Gap(25),
              AddressAddFields()
            ],
          ),
        ),
      ),
    );
  }
}
