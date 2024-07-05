import 'package:enigmate/authentication/create_acc_6.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:flutter/material.dart';

class CreateAcc5 extends StatefulWidget {
  const CreateAcc5({super.key});

  @override
  State<CreateAcc5> createState() => _CreateAcc5State();
}

final List<String> Ethnicity = [
  'African',
  'Asian',
  'European',
  'Hispanic/Latino',
  'Middle Eastern',
  'Native American',
  'Pacific Islander',
  'South Asian',
  'Caucasion',
  'Other'
];

class _CreateAcc5State extends State<CreateAcc5> {
  int? selectedIndex;
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
                          '5',
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
                    flex: 10, // 25% of the width
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
                text: "What's Your Ethnicity",
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
              itemCount: Ethnicity.length,
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
                            GlobalText(
                              text: Ethnicity[index],
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
              height: 30,
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
                          builder: (context) => CreateAcc6(),
                        ));
                  } else {
                    showErrorSnackBar('Please Select Ethnicity...');
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
