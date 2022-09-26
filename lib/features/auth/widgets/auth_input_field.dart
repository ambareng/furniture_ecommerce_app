import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthInputField extends HookWidget {
  final String fieldLabel;
  final bool isObscured;
  final TextEditingController controller;

  const AuthInputField(
      {Key? key,
      this.isObscured = false,
      required this.fieldLabel,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isObscuredLocal = useState(isObscured);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldLabel,
          style: GoogleFonts.nunitoSans(
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: lighterGray)),
        ),
        TextField(
          controller: controller,
          obscureText: isObscuredLocal.value,
          decoration: InputDecoration(
            suffixIcon: isObscured
                ? IconButton(
                    onPressed: () {
                      isObscuredLocal.value = !isObscuredLocal.value;
                    },
                    icon: Icon(
                      isObscuredLocal.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye_rounded,
                      color: lighterGray,
                    ))
                : null,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: lightestGray),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: lightestGray),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: lightestGray),
            ),
          ),
        )
      ],
    );
  }
}
