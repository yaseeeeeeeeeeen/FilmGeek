import 'package:filmgeek/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SnackBar customSnackbar(context, bool error, String messege) {
  return SnackBar(
    content: Text(
      messege,
      style: GoogleFonts.outfit(),
    ),
    backgroundColor: error ? mainTheme : Colors.red.shade900,
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  );
}