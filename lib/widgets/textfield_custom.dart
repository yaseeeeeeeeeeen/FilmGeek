import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfiled extends StatelessWidget {
  CustomTextfiled({super.key, required this.controller, required this.text});
  TextEditingController controller;
  String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: GoogleFonts.outfit(),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade600))),
      ),
    );
  }
}
