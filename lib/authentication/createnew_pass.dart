import 'package:enigmate/authentication/login_screen.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:enigmate/global/password_field.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class CreatenewPass extends StatefulWidget {
  const CreatenewPass({super.key});

  @override
  State<CreatenewPass> createState() => _CreatenewPassState();
}

class _CreatenewPassState extends State<CreatenewPass> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _newpass = TextEditingController();
  TextEditingController _confirmpass = TextEditingController();

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
                  text: "Create New Password",
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 16,
                ),
                GlobalText(
                  text:
                      "Your new password must be different from previous used password.",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greycolor,
                ),
                SizedBox(
                  height: 30,
                ),
                PasswordField(
                  controller: _newpass,
                  errorText: "Please Enter Password",
                  hintText: "New Password",
                ),
                SizedBox(
                  height: 16,
                ),
                PasswordField(
                  controller: _confirmpass,
                  errorText: "Please Enter Password Or Correct Password",
                  hintText: "Confirm Password",
                ),
                SizedBox(
                  height: 30,
                ),
                GlobalButton(
                  text: "Submit",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_newpass.text == _confirmpass.text) {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.success,
                          title: "Password Reset Successful",
                          text: "You can now login with your new password",
                          confirmBtnColor: AppColors.yellowcolor,
                          confirmBtnText: "Login",
                          onConfirmBtnTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                        );
                      } else {
                        QuickAlert.show(
                          context: context,
                          type: QuickAlertType.error,
                          title: "Error",
                          text:
                              "New password and confirm password do not match",
                          confirmBtnColor: AppColors.yellowcolor,
                          confirmBtnText: "OK",
                        );
                      }
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
