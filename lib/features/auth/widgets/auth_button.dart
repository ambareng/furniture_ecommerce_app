import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback callback;

  const AuthButton({Key? key, required this.buttonText, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
          backgroundColor: bgBlack,
          fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 50)),
      child: Text(
        buttonText,
        style: GoogleFonts.nunitoSans(
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
  }
}
