import 'package:enigmate/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneNumberInput extends StatefulWidget {
  final TextEditingController? controller;
  const PhoneNumberInput({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final _formKey = GlobalKey<FormState>();
  String? countryCode;
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.blackshade,
          border: Border.all(color: AppColors.greycolor),
          borderRadius: BorderRadius.circular(30),
        ),
        child: IntlPhoneField(
          cursorColor: AppColors.yellowcolor,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: 'Enter phone number',
            hintStyle: GoogleFonts.dmSans(color: AppColors.greycolor),
            border: InputBorder.none,
          ),
          initialCountryCode: 'US', // Set initial country code
          onChanged: (PhoneNumber phone) {
            setState(() {
              countryCode = phone.countryCode;
              phoneNumber = phone.number;
            });
          },
          style: TextStyle(color: Colors.white),
          textAlignVertical: TextAlignVertical.center,
          dropdownTextStyle: GoogleFonts.dmSans(color: AppColors.whitecolor),
          dropdownIcon: Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          disableLengthCheck:
              true, // Disable length check for different countries
          flagsButtonMargin: EdgeInsets.only(left: 10),
          flagsButtonPadding: EdgeInsets.symmetric(horizontal: 5),
          validator: (value) {
            if (value == null || value.completeNumber.isEmpty) {
              return 'Please enter a phone number';
            }
            // Add more validation logic if needed
            return null;
          },
        ),
      ),
    );
  }
}
