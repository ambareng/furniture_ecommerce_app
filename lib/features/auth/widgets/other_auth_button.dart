import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/auth/bloc/auth_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class OtherAuthButton extends StatelessWidget {
  final String buttonText;
  final String url;

  const OtherAuthButton({Key? key, required this.buttonText, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (state is! AuthAuthenticatingState) {
              Navigator.pushNamed(context, url);
            }
          },
          child: Text(
            buttonText,
            style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 18, color: black)),
          ),
        );
      },
    );
  }
}
