import 'package:flutter/material.dart';

class FurnitureScreen extends StatelessWidget {
  const FurnitureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: Text('Furniture'),
        ),
      ),
    );
  }
}
