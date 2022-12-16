import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_ecommerce_app/core/auth/bloc/auth_bloc.dart';
import 'package:furniture_ecommerce_app/features/auth/widgets/auth_button.dart';
import 'package:furniture_ecommerce_app/features/auth/widgets/auth_input_field.dart';
import 'package:furniture_ecommerce_app/features/auth/widgets/other_auth_button.dart';
import 'package:gap/gap.dart';

class SignupForm extends HookWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthInputField(
          controller: firstNameController,
          fieldLabel: 'First name',
        ),
        const Gap(35),
        AuthInputField(
          controller: lastNameController,
          fieldLabel: 'Last name',
        ),
        const Gap(35),
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
        const Gap(35),
        AuthInputField(
          controller: confirmPasswordController,
          isObscured: true,
          fieldLabel: 'Confirm Password',
        ),
        const Gap(50),
        Align(
            alignment: Alignment.center,
            child: AuthButton(
              buttonText: 'Sign up',
              callback: () {
                BlocProvider.of<AuthBloc>(context).add(AuthRegisterEvent(
                    email: emailController.text,
                    password: passwordController.text,
                    confirmPassword: confirmPasswordController.text,
                    lastName: lastNameController.text,
                    firstName: firstNameController.text));
              },
            )),
        const Gap(35),
        const Align(
            alignment: Alignment.center,
            child: OtherAuthButton(buttonText: 'LOG IN', url: '/login')),
        const Gap(100),
      ],
    );
  }
}
