import 'package:filmgeek/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutRichText extends StatelessWidget {
  AboutRichText({super.key, required this.textOne, required this.textTwo});
  String textOne;
  String textTwo;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
                text: "$textOne : ",
                style: GoogleFonts.outfit(
                    color: black, fontSize: 15, fontWeight: FontWeight.w400)),
            TextSpan(
                text: " $textTwo",
                style: GoogleFonts.outfit(
                    color: black, fontSize: 15, fontWeight: FontWeight.w300))
          ],
        ),
      ),
    );
  }
}
