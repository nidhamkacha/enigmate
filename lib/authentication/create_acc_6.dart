import 'package:enigmate/authentication/create_acc_7.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:flutter/material.dart';

class CreateAcc6 extends StatefulWidget {
  const CreateAcc6({super.key});

  @override
  State<CreateAcc6> createState() => _CreateAcc6State();
}

final List<Map<String, String>> items = [
  {'image': 'assets/images/Aries.png', 'text': 'Aries'},
  {'image': 'assets/images/Taurus.png', 'text': 'Taurus'},
  {'image': 'assets/images/Gemini.png', 'text': 'Gemini'},
  {'image': 'assets/images/Leo.png', 'text': 'Leo'},
  {'image': 'assets/images/Virgo.png', 'text': 'Vigro'},
  {'image': 'assets/images/Libra.png', 'text': 'Libra'},
  {'image': 'assets/images/Scorpio.png', 'text': 'Scorpio'},
  {'image': 'assets/images/Sagittarius.png', 'text': 'Sagittarius'},
  {'image': 'assets/images/Capricorn.png', 'text': 'Capricorn'},
  {'image': 'assets/images/Aquarius.png', 'text': 'Aquarius'},
  {'image': 'assets/images/Pisces.png', 'text': 'Pisces'},
];

class _CreateAcc6State extends State<CreateAcc6> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                          '6',
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
                    flex: 12, // 25% of the width
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
                text: "What's Your Horoscope",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        width: 260,
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Color(0xFFD99E10)
                              : AppColors.blackshade,
                          border: Border.all(color: AppColors.greycolor),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              items[index]['image'].toString(),
                              color: selectedIndex == index
                                  ? AppColors.whitecolor
                                  : AppColors.greycolor,
                              scale: 3,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            GlobalText(
                              text: items[index]['text'],
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalButton(
                text: "Next",
                onPressed: () {
                  if (selectedIndex != null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAcc7(),
                        ));
                  }
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
