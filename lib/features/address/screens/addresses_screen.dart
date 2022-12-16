import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/back_icon.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/address/widgets/addresses_list.dart';
import 'package:furniture_ecommerce_app/features/home/widgets/top_bar.dart';
import 'package:gap/gap.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 50.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/address/add');
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
                bottomHeader: 'Shipping address',
                leftIcon: BackIconButton(),
              ),
              Gap(25),
              AddressesList()
            ],
          ),
        ),
      ),
    );
  }
}
