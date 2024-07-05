import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GlobalButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;

  const GlobalButton({Key? key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Colors.transparent, // Set button color to transparent
          padding: EdgeInsets.zero, // Remove default button padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xFFD99E10), // #D99E10
                Color(0xFFFFC946), // #FFC946
              ],
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Container(
            constraints: BoxConstraints(minWidth: 88, minHeight: 55),
            alignment: Alignment.center,
            child: Text(
              text ?? "",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
