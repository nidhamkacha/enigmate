import 'package:enigmate/bottom_navbar.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:flutter/material.dart';

class CreateAcc10 extends StatefulWidget {
  const CreateAcc10({super.key});

  @override
  State<CreateAcc10> createState() => _CreateAcc10State();
}

class _CreateAcc10State extends State<CreateAcc10> {
  int _isSelected = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                      path: 'assets/images/back_button.png',
                    ),
                  ),
                ),
                SizedBox(
                  width: 125,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: ShaderMask(
                          shaderCallback: (bounds) => LinearGradient(
                            colors: [
                              Color(0xFFD99E10), // #D99E10
                              Color(0xFFFFC946), // #FFC946
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ).createShader(bounds),
                          child: Text(
                            '10',
                            style: TextStyle(
                              color: Colors
                                  .white, // color is ignored due to ShaderMask
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '/10',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
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
                  flex: 30, // 25% of the width
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
                  flex: 0, // 75% of the width
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
              text: "Which one are you ?",
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isSelected = 0;
              });
            },
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.23,
                width: MediaQuery.of(context).size.width * 0.44,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: _isSelected == 0
                            ? AppColors.yellowcolor
                            : Color.fromARGB(255, 48, 46, 46)),
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.blackshade),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/angle.png'),
                    GlobalText(
                      text: "I'm Angle",
                      color: AppColors.whitecolor,
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isSelected = 1;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.22,
                width: MediaQuery.of(context).size.width * 0.44,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: _isSelected == 1
                            ? Colors.purple
                            : Color.fromARGB(255, 48, 46, 46)),
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.blackshade),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/demon.png'),
                    GlobalText(
                      text: "I'm Demon",
                      color: AppColors.whitecolor,
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GlobalButton(
              text: "Finish",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavbar(),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
