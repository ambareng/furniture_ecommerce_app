import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/features/address/screens/address_add_screen.dart';

class AddressEditScreen extends StatelessWidget {
  const AddressEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AddressAddScreen(
      isEdit: true,
    );
  }
}
