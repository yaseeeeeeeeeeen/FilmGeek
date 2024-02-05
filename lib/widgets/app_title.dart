import 'package:filmgeek/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppNameCard extends StatelessWidget {
  const AppNameCard({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return Hero(
      tag: "AppTitle",
      child: SizedBox(
        height: media.height / 13,
        width: media.width,
        child: Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'Welcome to ',
                    style: GoogleFonts.poppins(
                        color: black.withOpacity(0.9), fontSize: 20)),
                TextSpan(
                    text: 'FilmGeek',
                    style: GoogleFonts.outfit(
                        color: mainTheme,
                        fontSize: 23,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
