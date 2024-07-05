import 'package:enigmate/authentication/verification_forgotpass.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:enigmate/global/globatextfield.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Email validation regular expression
  final _emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

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
                  text: "Forgot Password",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 16,
                ),
                GlobalText(
                  text:
                      "Please enter your Email Address. You willreceive a 4-digit code via SMS.",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greycolor,
                ),
                SizedBox(
                  height: 30,
                ),
                GlobalTextfield(
                  controller: emailController,
                  hintText: "Enter Email Address",
                  ErrorText: "Please enter a valid email address",
                
                ),
                SizedBox(
                  height: 450,
                ),
                GlobalButton(
                  text: "Submit",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerificationForgotpass(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}