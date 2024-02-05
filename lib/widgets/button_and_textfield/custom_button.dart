import 'package:filmgeek/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.onPressed,required this.title});
  void Function()? onPressed;
  String title;
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: mainTheme,
            fixedSize: Size(media.width, 50)),
        onPressed: onPressed,
        child: Text(title, style: GoogleFonts.outfit(color: white)));
  }
}
