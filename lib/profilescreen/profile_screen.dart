import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
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
                  width: 115,
                ),
                GlobalText(
                  text: "My Profile",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 100,
              width: 100,
              child: Image.asset('assets/images/Profile Img.png'),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GlobalText(
                  text: "Juliana Evans,26",
                ),
                Image.asset(
                  'assets/images/Blue_Tick.png',
                  scale: 3,
                )
              ],
            ),
            GlobalText(
              text: "@Juliana_evans",
              color: AppColors.greycolor,
            ),
            SizedBox(
              height: 20,
            ),
            GlobalButton(
              text: "Complete Profile",
            ),
          ],
        ),
      ),
    );
  }
}
