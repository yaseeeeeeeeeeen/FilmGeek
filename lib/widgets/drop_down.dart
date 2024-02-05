import 'package:filmgeek/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropdownDemo extends StatefulWidget {
  DropdownDemo({Key? key, required this.professionController})
      : super(key: key);

  final TextEditingController professionController;

  @override
  _DropdownDemoState createState() => _DropdownDemoState();
}

class _DropdownDemoState extends State<DropdownDemo> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade600),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(10),
        value: selectedValue,
        elevation: 16,
        style: GoogleFonts.outfit(color: black),
        isExpanded: true,
        itemHeight: 50,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue;
            widget.professionController.text = newValue ?? '';
          });
        },
        hint: Text(
          'Profession',
          style: GoogleFonts.outfit(color: black),
        ),
        items: <String>['Developer', 'Doctor', 'Student', 'Trader', 'Other']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
