import 'package:enigmate/authentication/create_acc_screen.dart';
import 'package:enigmate/authentication/forgot_password.dart';
import 'package:enigmate/bottom_navbar.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:enigmate/global/globatextfield.dart';
import 'package:enigmate/global/password_field.dart';
import 'package:enigmate/global/phoneandcounty_picker.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                GlobalText(
                  text: "Welcome 👋",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.all(6),
                  width: MediaQuery.of(context).size.width,
                  height: 66,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    color: Colors.black,
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected[0] = true;
                              isSelected[1] = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: isSelected[0]
                                    ? const LinearGradient(
                                        colors: [
                                          Color(0xFFD99E10),
                                          Color(0xFFFFC946)
                                        ],
                                      )
                                    : const LinearGradient(
                                        colors: [Colors.black, Colors.black],
                                      ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40))),
                            alignment: Alignment.center,
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 17,
                                color:
                                    isSelected[0] ? Colors.white : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isSelected[0] = false;
                              isSelected[1] = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: isSelected[1]
                                    ? const LinearGradient(
                                        colors: [
                                          Color(0xFFD99E10),
                                          Color(0xFFFFC946)
                                        ],
                                      )
                                    : const LinearGradient(
                                        colors: [Colors.black, Colors.black],
                                      ),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(40))),
                            alignment: Alignment.center,
                            child: Text(
                              'Phone Number',
                              style: TextStyle(
                                fontSize: 17,
                                color:
                                    isSelected[1] ? Colors.white : Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 45),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (isSelected[0] == true)
                      GlobalTextfield(
                        controller: _emailController,
                        hintText: "Enter Email Address",
                        ErrorText: "Please enter Your Email Address",
                      )
                    else
                      PhoneNumberInput(
                        controller: _phoneController,
                      ),
                    const SizedBox(
                      height: 35,
                    ),
                    PasswordField(
                      controller: _passwordController,
                      errorText: "Please Enter Password",
                      hintText: "Enter Password",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ));
                      },
                      child: GlobalText(
                          text: "Forgot password ?",
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    GlobalButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BottomNavbar(),
                              ));
                        }
                      },
                      text: "Login",
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 1,
                          color: const Color.fromARGB(255, 65, 63, 63),
                        )),
                        GlobalText(
                          text: "or Login With ",
                          color: Colors.grey,
                        ),
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 1,
                          color: const Color.fromARGB(255, 65, 63, 63),
                        )),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageComponent(
                          path: "assets/images/google.png",
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ImageComponent(
                          path: "assets/images/facebook.png",
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        ImageComponent(
                          path: "assets/images/apple.png",
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GlobalText(
                        text: "Don't have an Account?", color: Colors.grey),
                    SizedBox(
                      width: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAccScreen(),
                            ));
                      },
                      child: GlobalText(
                        text: "Sign up",
                        color: AppColors.yellowcolor,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
