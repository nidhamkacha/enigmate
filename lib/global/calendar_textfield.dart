import 'package:enigmate/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // For date formatting

class CalendarTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon suffixicon;

  CalendarTextfield({
    required this.controller,
    required this.hintText,
    required this.suffixicon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please Select Date';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.dmSans(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: AppColors.greycolor),
          ),
          filled: true,
          fillColor: AppColors.blackshade,
          suffixIcon: InkWell(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('dd-MM-yyyy').format(pickedDate);
                controller.text = formattedDate;
              }
            },
            child: suffixicon,
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
