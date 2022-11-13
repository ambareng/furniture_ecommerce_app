import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/auth/bloc/auth_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback callback;

  const AuthButton({Key? key, required this.buttonText, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: callback,
          style: ElevatedButton.styleFrom(
              backgroundColor: bgBlack,
              fixedSize: Size(MediaQuery.of(context).size.width * 0.7, 50)),
          child: state is AuthAuthenticatingState
              ? const Center(
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 1.5,
                    ),
                  ),
                )
              : Text(
                  buttonText,
                  style: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
        );
      },
    );
  }
}
