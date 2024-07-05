import 'package:enigmate/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordField extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;

  const PasswordField({
    Key? key,
    this.hintText,
    this.errorText,
    this.controller,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
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
        obscureText: _obscureText, // Obscure text based on flag
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.blackshade,
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: AppColors.greycolor,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText; // Toggle the flag
              });
            },
          ),
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
              color: AppColors.yellowcolor,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.errorText;
          }
          return null;
        },
      ),
    );
  }
}
