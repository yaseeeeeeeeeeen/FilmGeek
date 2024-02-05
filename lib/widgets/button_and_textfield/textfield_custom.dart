import 'package:filmgeek/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextfiled extends StatelessWidget {
  CustomTextfiled(
      {super.key,
      this.keyboardType,
      this.obsecure,
      required this.controller,
      required this.text,
      required this.validator});
    TextInputType? keyboardType;
  bool? obsecure;
  TextEditingController controller;
  String? Function(String?)? validator;
  String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        keyboardType: keyboardType?? TextInputType.name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        obscureText: obsecure ?? false,
        style: GoogleFonts.outfit(color: black),
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: GoogleFonts.outfit(color: black),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade600))),
      ),
    );
  }
}
