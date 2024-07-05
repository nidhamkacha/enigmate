import 'package:enigmate/authentication/otp_verification.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/calendar_textfield.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:enigmate/global/globatextfield.dart';
import 'package:enigmate/global/minded_field.dart';
import 'package:enigmate/global/password_field.dart';
import 'package:enigmate/global/religion_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CreateAccScreen extends StatefulWidget {
  const CreateAccScreen({super.key});

  @override
  State<CreateAccScreen> createState() => _CreateAccScreenState();
}

class _CreateAccScreenState extends State<CreateAccScreen> {
  final _formKey = GlobalKey<FormState>();
  String? countryCode;
  String? phoneNumber;
  bool _isChecked = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phoneno = TextEditingController();
  TextEditingController _dateofbirth = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _cpass = TextEditingController();
  TextEditingController _region = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                      height: 24,
                      width: 24,
                      child: ImageComponent(
                          path: 'assets/images/back_button.png')),
                ),
                SizedBox(
                  height: 40,
                ),
                GlobalText(
                  text: "Create Account",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 30,
                ),
                GlobalTextfield(
                  ErrorText: "Enter Your Full Name",
                  controller: _name,
                  hintText: "Full Name",
                ),
                SizedBox(
                  height: 20,
                ),
                GlobalTextfield(
                  ErrorText: "Enter Your Username",
                  controller: _username,
                  hintText: "User Name",
                ),
                SizedBox(
                  height: 20,
                ),
                GlobalTextfield(
                  ErrorText: "Enter Your Email",
                  controller: _email,
                  hintText: "Enter Email",
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.blackshade,
                    border: Border.all(color: AppColors.greycolor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: IntlPhoneField(
                    cursorColor: AppColors.yellowcolor,
                    controller: _phoneno,
                    decoration: InputDecoration(
                      hintText: 'Enter phone number',
                      hintStyle: GoogleFonts.dmSans(color: AppColors.greycolor),
                      border: InputBorder.none,
                    ),
                    initialCountryCode: 'US',
                    onChanged: (PhoneNumber phone) {
                      setState(() {
                        countryCode = phone.countryCode;
                        phoneNumber = phone.number;
                      });
                    },
                    style: TextStyle(color: Colors.white),
                    textAlignVertical: TextAlignVertical.center,
                    dropdownTextStyle:
                        GoogleFonts.dmSans(color: AppColors.whitecolor),
                    dropdownIcon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                    disableLengthCheck: true,
                    flagsButtonMargin: EdgeInsets.only(left: 10),
                    flagsButtonPadding: EdgeInsets.symmetric(horizontal: 5),
                    validator: (phone) {
                      try {
                        if (phone == null ||
                            phone.number.isEmpty ||
                            _phoneno.text == null) {
                          return 'Please enter a phone number';
                        }
                        return null;
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                // GlobalTextfield(
                //   controller: _dateofbirth,
                //   hintText: "Date Of Birth",
                //   suffixicon: Icon(Icons.calendar_month),
                // ),
                CalendarTextfield(
                  controller: _dateofbirth,
                  hintText: "Date Of Birth",
                  suffixicon: Icon(Icons.calendar_month, color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                ),
                // GlobalTextfield(
                //   hintText: "Minded",
                //   suffixicon: Icon(Icons.arrow_drop_down),
                // ),
                MindedField(
                  hintText: "Minded",
                  errorText: "Please Selecet",
                ),
                SizedBox(
                  height: 20,
                ),
                RegionField(
                  hintText: "Select Religion",
                  errorText: "Please select a region",
                  controller: _region,
                ),
                // GlobalTextfield(
                //   suffixicon: Icon(Icons.arrow_drop_down),
                //   hintText: "Religion",
                // ),
                SizedBox(
                  height: 20,
                ),
                // GlobalTextfield(
                //   suffixicon: Icon(Icons.remove_red_eye),
                //   hintText: "Enter Password",
                //   controller: _pass,
                // ),
                PasswordField(
                  controller: _pass,
                  errorText: "Please Enter Password",
                  hintText: "Entert Password",
                ),
                SizedBox(
                  height: 20,
                ),
                // GlobalTextfield(
                //   suffixicon: Icon(Icons.remove_red_eye),
                //   hintText: "Confirm Password",
                //   controller: _cpass,
                // ),
                PasswordField(
                  controller: _cpass,
                  errorText: "Please Enter Password",
                  hintText: "Confirm Password",
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value ?? false;
                        });
                      },
                      checkColor: Colors.white, // Color of the check mark
                      activeColor: AppColors
                          .yellowcolor, // Color of the checkbox when checked
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isChecked = !_isChecked;
                        });
                      },
                      child: Text(
                        "I agree to the terms and conditions",
                        style: GoogleFonts.dmSans(
                          color:
                              _isChecked ? AppColors.yellowcolor : Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GlobalButton(
                  text: "Next",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_pass.text != _cpass.text) {
                        var snackBar =
                            SnackBar(content: Text('Password Not Match'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OtpVerification(
                                phoneno: _phoneno.text,
                                email: _email.text,
                              ),
                            ));
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
