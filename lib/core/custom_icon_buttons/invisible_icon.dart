import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/custom_icon_buttons/custom_icon_button.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';

class InvisibleIconButton extends StatelessWidget {
  const InvisibleIconButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.abc,
        color: Colors.transparent,
      ),
    );
  }
}
