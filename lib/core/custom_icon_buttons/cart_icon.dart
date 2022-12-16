import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/custom_icon_button.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';

class CartIconButton extends StatelessWidget {
  const CartIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
        func: () => Navigator.pushNamed(context, '/my_cart'),
        icon: const Icon(
          Icons.shopping_cart_outlined,
          color: lightGray,
        ));
  }
}
