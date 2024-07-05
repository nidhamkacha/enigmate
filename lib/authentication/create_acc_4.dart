import 'package:enigmate/authentication/create_acc_5.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAcc4 extends StatefulWidget {
  const CreateAcc4({super.key});

  @override
  State<CreateAcc4> createState() => _CreateAcc4State();
}

class _CreateAcc4State extends State<CreateAcc4> {
  bool isYesSelected = false;
  bool isNoSelected = false;
  double _annualIncome = 50;
   final TextEditingController _aboutYouController = TextEditingController();
  final TextEditingController _lookingForController = TextEditingController();
 bool validateInputs() {
    if (!isYesSelected && !isNoSelected) {
      return false;
    }
    if (_aboutYouController.text.trim().isEmpty) {
      return false;
    }
    if (_lookingForController.text.trim().isEmpty) {
      return false;
    }
    return true;
  }

  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
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
                    width: 125,
                  ),
                   Row(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: [
                            Color(0xFFD99E10),
                            Color(0xFFFFC946),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ).createShader(bounds),
                        child: Text(
                          '4',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                          ),
                        ),
                      ),
                      Text(
                        '/10',
                        style: TextStyle(
                          color: AppColors.greycolor,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 19,
            ),
            Container(
              height: 3, // Adjust the height of the spacer as needed
              width: MediaQuery.of(context).size.width, // Make it full-width
              child: Row(
                children: [
                  Expanded(
                    flex: 8, // 25% of the width
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFD99E10), // #D99E10
                            Color(0xFFFFC946), // #FFC946
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 10, // 75% of the width
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalText(
                text: "Are You Handicap ?",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle 'Yes' button tap
                      setState(() {
                        isYesSelected = true;
                        isNoSelected = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 157,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greycolor),
                        color: isYesSelected
                            ? AppColors.yellowcolor
                            : AppColors.blackshade,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(child: GlobalText(text: "Yes")),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle 'No' button tap
                      setState(() {
                        isYesSelected = false;
                        isNoSelected = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 157,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.greycolor),
                        color: isNoSelected
                            ? AppColors.yellowcolor
                            : AppColors.blackshade,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(child: GlobalText(text: "No")),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalText(
                text: "About You",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 120,
                ),
                child: TextField(
                  controller: _aboutYouController,
                  style: GoogleFonts.dmSans(
                    color: Colors.white,
                  ),
                  cursorColor: AppColors.yellowcolor,
                  // controller: widget.controller,
                  decoration: InputDecoration(
                    filled: true, // This enables the background fill color
                    fillColor: AppColors
                        .blackshade, // This sets the background color to blackshade
                    hintText: "Add more about you",
                    hintStyle: TextStyle(color: AppColors.greycolor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors
                            .yellowcolor, // Change this to the desired color
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  maxLines: 5, // This allows the TextField to expand vertically
                  minLines:
                      5, // This sets the minimum lines the TextField should have
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalText(
                text: "Looking For",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 120,
                ),
                child: TextField(
                  controller: _lookingForController,
                  cursorColor: AppColors.yellowcolor,
                  style: GoogleFonts.dmSans(
                    color: AppColors.whitecolor,
                  ),
                  // controller: widget.controller,
                  decoration: InputDecoration(
                    filled: true, // This enables the background fill color
                    fillColor: AppColors
                        .blackshade, // This sets the background color to blackshade
                    hintText: "Add more about you",
                    hintStyle: TextStyle(color: AppColors.greycolor),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors
                            .yellowcolor, // Change this to the desired color
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  maxLines: 5, // This allows the TextField to expand vertically
                  minLines:
                      5, // This sets the minimum lines the TextField should have
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalText(
                text: "My Annual Income",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Stack(
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 12),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 24),
                    activeTrackColor: AppColors.yellowcolor,
                    inactiveTrackColor: Colors.grey,
                  ),
                  child: Slider(
                    value: _annualIncome,
                    min: 0,
                    max: 200,
                    inactiveColor: AppColors.whitecolor,
                    activeColor: AppColors.yellowcolor,
                    thumbColor: AppColors.whitecolor,
                    divisions: 200,
                    onChanged: (double value) {
                      setState(() {
                        _annualIncome = value;
                      });
                    },
                  ),
                ),
                Positioned(
                  left: 30 +
                      (_annualIncome / 200) *
                          (MediaQuery.of(context).size.width - 90),
                  bottom: 30,
                  child: Text(
                    '${_annualIncome.toStringAsFixed(0)}K',
                    style: const TextStyle(
                      color: AppColors.whitecolor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalButton(
                text: "Next",
               onPressed: () {
                  if (validateInputs()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAcc5(),
                        ));
                  } else {
                    showErrorSnackBar('Please fill in all fields before proceeding.');
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
