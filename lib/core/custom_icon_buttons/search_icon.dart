import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/custom_icon_button.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';

class SearchIconButton extends StatelessWidget {
  const SearchIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
        func: () {},
        icon: const Icon(
          Icons.search_outlined,
          color: lightGray,
        ));
  }
}
