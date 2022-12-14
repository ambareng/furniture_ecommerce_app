import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:furniture_ecommerce_app/core/auth/bloc/auth_bloc.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:furniture_ecommerce_app/features/auth/widgets/auth_button.dart';
import 'package:furniture_ecommerce_app/features/auth/widgets/auth_input_field.dart';
import 'package:furniture_ecommerce_app/features/auth/widgets/other_auth_button.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends HookWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    loginHandler(BuildContext context) {
      BlocProvider.of<AuthBloc>(context).add(AuthLoginEvent(
          email: emailController.text, password: passwordController.text));
    }

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthAuthenticatedState) {
          Fluttertoast.showToast(
              msg: 'Logged in Successfully!', gravity: ToastGravity.TOP);
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        } else if (state is AuthErrorState) {
          if (state.errorList.containsKey('email')) {
            Fluttertoast.showToast(
                msg: 'Email: ${state.errorList["email"][0]}',
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.red[400],
                toastLength: Toast.LENGTH_LONG,
                timeInSecForIosWeb: 5);
          }
          if (state.errorList.containsKey('password')) {
            Fluttertoast.showToast(
                toastLength: Toast.LENGTH_LONG,
                msg: 'Password: ${state.errorList["password"][0]}',
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.red[400],
                timeInSecForIosWeb: 5);
          }
          if (state.errorList.containsKey('detail')) {
            Fluttertoast.showToast(
                toastLength: Toast.LENGTH_LONG,
                msg: state.errorList['detail'],
                gravity: ToastGravity.TOP,
                backgroundColor: Colors.red[400],
                timeInSecForIosWeb: 5);
          }
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthInputField(
                controller: emailController,
                fieldLabel: 'Email',
              ),
              const Gap(35),
              AuthInputField(
                controller: passwordController,
                isObscured: true,
                fieldLabel: 'Password',
              ),
              const Gap(50),
              const Align(alignment: Alignment.center, child: ForgotPassword()),
              const Gap(50),
              Align(
                  alignment: Alignment.center,
                  child: state is! AuthAuthenticatingState
                      ? AuthButton(
                          buttonText: 'Log in',
                          callback: () => loginHandler(context),
                        )
                      : const CircularProgressIndicator()),
              const Gap(35),
              const Align(
                  alignment: Alignment.center,
                  child:
                      OtherAuthButton(buttonText: 'SIGN UP', url: '/signup')),
            ],
          );
        },
      ),
    );
  }
}

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Text('Forgot Password',
          style: GoogleFonts.nunitoSans(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 18, color: black))),
    );
  }
}
