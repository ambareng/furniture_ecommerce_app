import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_ecommerce_app/core/auth/bloc/auth_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/auth/widgets/auth_bar.dart';
import 'package:furniture_ecommerce_app/features/auth/widgets/login_form.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async => state is! AuthAuthenticatingState,
          child: Container(
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
                      Text(
                        'Hello!',
                        style: GoogleFonts.merriweather(
                            textStyle: const TextStyle(
                                fontSize: 30,
                                letterSpacing: 1.1,
                                fontWeight: FontWeight.w400,
                                color: lighterGray)),
                      ),
                      const Gap(10),
                      Text(
                        'WELCOME BACK',
                        style: GoogleFonts.merriweather(
                            textStyle: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: black,
                          letterSpacing: 1.1,
                        )),
                      ),
                      const Gap(35),
                      const LoginForm()
                    ],
                  ),
                ))
              ],
            ),
          ),
        );
      },
    ));
  }
}
