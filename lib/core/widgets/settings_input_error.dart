import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsInputError extends StatelessWidget {
  final List? errorList;

  const SettingsInputError({Key? key, this.errorList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (errorList != null) {
      return Padding(
        padding: const EdgeInsets.all(2.5),
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: errorList?.length,
            itemBuilder: ((context, index) {
              return Text(
                errorList?[index],
                style: GoogleFonts.nunitoSans(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.red[300],
                        fontStyle: FontStyle.italic)),
              );
            })),
      );
    } else {
      return Container();
    }
  }
}
