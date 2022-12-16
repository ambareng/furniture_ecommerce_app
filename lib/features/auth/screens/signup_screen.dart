import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_ecommerce_app/core/auth/bloc/auth_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/auth/widgets/auth_bar.dart';
import 'package:furniture_ecommerce_app/features/auth/widgets/signup_form.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupScreen extends HookWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          if (state.errorList.containsKey('errors')) {
            final Map<String, dynamic> errorList = state.errorList['errors'];
            Fluttertoast.showToast(
                msg: '${errorList.values.toList().first[0]}',
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.red[400],
                toastLength: Toast.LENGTH_LONG,
                timeInSecForIosWeb: 5);
          }
        }
      },
      child: Scaffold(
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
      )),
    );
  }
}
