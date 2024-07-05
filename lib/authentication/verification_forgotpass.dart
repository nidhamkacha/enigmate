import 'package:enigmate/authentication/createnew_pass.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class VerificationForgotpass extends StatefulWidget {
  const VerificationForgotpass({super.key});

  @override
  State<VerificationForgotpass> createState() => _VerificationForgotpassState();
}

class _VerificationForgotpassState extends State<VerificationForgotpass> {
  final pinputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                  child: ImageComponent(path: 'assets/images/back_button.png')),
            ),
            SizedBox(
              height: 40,
            ),
            GlobalText(
              text: "Enter Verificatio Code",
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 16,
            ),
            GlobalText(
              text:
                  "Please check your Email for the 4 digit\nOTP code and enter it below",
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.greycolor,
            ),
            SizedBox(
              height: 30,
            ),
            Pinput(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              focusedPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Color.fromRGBO(30, 60, 87, 1),
                  fontWeight: FontWeight.w600,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.yellowcolor),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              length: 4,
              showCursor: true,
              controller: pinputController,
              onChanged: (value) {
                // Handle the value change here
              },
            ),
            SizedBox(
              height: 50,
            ),
            GlobalButton(
              text: "Verify",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreatenewPass(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlobalText(
                  text: "Don't receive an otp?",
                  color: AppColors.greycolor,
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {},
                  child: GlobalText(
                    text: "Resend",
                    decoration: TextDecoration.underline,
                    color: AppColors.yellowcolor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
