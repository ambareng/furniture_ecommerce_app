import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback func;
  final Icon icon;

  const CustomIconButton({Key? key, required this.func, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: func, icon: icon);
  }
}
