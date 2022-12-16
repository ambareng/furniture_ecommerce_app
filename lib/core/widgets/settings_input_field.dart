import 'package:flutter/material.dart';
import 'package:furniture_ecommerce_app/core/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsInputField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String placeholder;

  const SettingsInputField(
      {Key? key,
      required this.controller,
      required this.label,
      required this.placeholder})
      : super(key: key);

  @override
  State<SettingsInputField> createState() => _SettingsInputFieldState();
}

class _SettingsInputFieldState extends State<SettingsInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 66,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.controller.text.isNotEmpty
            ? Colors.transparent
            : unselectedCategory,
        borderRadius: BorderRadius.circular(10),
        border: widget.controller.text.isNotEmpty
            ? Border.all(width: 1, color: lightestGray)
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: lightGray)),
          ),
          TextField(
            onChanged: (value) => {setState(() {})},
            style: GoogleFonts.nunitoSans(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w600, fontSize: 16, color: bgBlack)),
            controller: widget.controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: widget.placeholder,
                hintStyle: GoogleFonts.nunitoSans(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFFB3B3B3)))),
          )
        ],
      ),
    );
  }
}
