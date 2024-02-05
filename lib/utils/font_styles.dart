import 'package:filmgeek/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  static TextStyle movieName =
      GoogleFonts.nanumMyeongjo(fontSize: 15, fontWeight: FontWeight.w800);
  static TextStyle subTitles = GoogleFonts.lato();
  static TextStyle subTitlesblue =
      GoogleFonts.outfit(color: Colors.blue.shade800);

  static TextStyle appbarTitle = GoogleFonts.outfit(
      color: blue, fontSize: 23, fontWeight: FontWeight.w600);
}
