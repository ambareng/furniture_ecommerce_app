import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/auth/widgets/auth_bar.dart';
import 'package:furniture_ecommerce_app/features/auth/widgets/signup_form.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends HookWidget {
  SignupScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> authFields = [
    {"fieldLabel": "Name"},
    {"fieldLabel": "Email"},
    {"fieldLabel": "Password", "isObscured": true},
    {"fieldLabel": "Confirm Password", "isObscured": true}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.075),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(50),
                const AuthBar(),
                const Gap(35),
                const Gap(10),
                Text(
                  'WELCOME',
                  style: GoogleFonts.merriweather(
                      textStyle: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: black,
                    letterSpacing: 1.1,
                  )),
                ),
                const Gap(35),
                const SignupForm()
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
