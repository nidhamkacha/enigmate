import 'package:enigmate/authentication/create_acc_1.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:enigmate/global/globatextfield.dart';
import 'package:flutter/material.dart';

class OtpVerification extends StatefulWidget {
  final String? phoneno;
  final String? email;
  const OtpVerification(
      {super.key, required this.phoneno, required this.email});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
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
                    child:
                        ImageComponent(path: 'assets/images/back_button.png')),
              ),
              SizedBox(
                height: 40,
              ),
              GlobalText(
                text: "OTP Verification",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 40,
              ),
              GlobalText(
                text: "Code will be sent to ${widget.phoneno} ",
              ),
              SizedBox(
                height: 10,
              ),
              GlobalTextfield(
                hintText: "Mobile Verification Code",
              ),
              SizedBox(
                height: 20,
              ),
              GlobalText(
                  text: "Code will be sent to ${widget.email}", fontSize: 15),
              SizedBox(
                height: 10,
              ),
              GlobalTextfield(
                hintText: "Email Verification Code",
              ),
              SizedBox(
                height: 340,
              ),
              GlobalButton(
                text: "Verify",
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAcc1(),
                      ));
                },
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
