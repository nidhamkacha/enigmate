import 'package:enigmate/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalTextfield extends StatefulWidget {
  final String? hintText;
  final String? ErrorText;
  final Icon? suffixicon;
  final TextEditingController? controller;

  const GlobalTextfield({
    Key? key,
    this.hintText,
    this.ErrorText,
    this.controller,
    this.suffixicon,
  }) : super(key: key);

  @override
  State<GlobalTextfield> createState() => _GlobalTextfieldState();
}

class _GlobalTextfieldState extends State<GlobalTextfield> {
  final _emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: TextFormField(
        cursorColor: AppColors.yellowcolor,
        style: GoogleFonts.dmSans(
          color: Colors.white,
        ),
        controller: widget.controller,
        decoration: InputDecoration(
          filled: true, // This enables the background fill color
          fillColor: AppColors
              .blackshade, // This sets the background color to blackshade
          suffixIcon: widget.suffixicon,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: AppColors.greycolor),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.whitecolor,
            ),
            borderRadius: BorderRadius.circular(30),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.yellowcolor, // Change this to the desired color
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.ErrorText;
          }
          // else if (!_emailRegExp.hasMatch(value)) {
          //   return 'Please enter a valid email address';
          // }
          return null;
        },
      ),
    );
  }
}
