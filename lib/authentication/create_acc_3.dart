import 'package:enigmate/authentication/create_acc_4.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:flutter/material.dart';

class CreateAcc3 extends StatefulWidget {
  const CreateAcc3({super.key});

  @override
  State<CreateAcc3> createState() => _CreateAcc3State();
}

class _CreateAcc3State extends State<CreateAcc3> {
  final List<String> interests = [
    'Foodie Tour',
    'Broadway',
    'Fashion',
    'Social Development',
    'Boxing',
    'Sake',
    'Escape Cafe',
    'Environmental Protection',
    'Reggaeton',
    'Makeup',
    'Motor Sports',
    'Pilates',
    'Wrestling',
    'Online Game',
    'Working Out',
    'Korean Food',
    'Drawing',
    'Picnicking',
    'Motorcycles',
    'Vlogging',
    'Disney',
    'Pimms',
    'Other'
  ];

  final List<String> hobbies = [
    'Traveling',
    'Airplane Model Building',
    'Art',
    'Baking',
    'Dance',
    'Acting',
    'Learning',
    'Photography',
    'Boxing',
    'Knitting',
    'Writing',
    'Gardening',
    'Cooking',
    'Other'
  ];

  final List<int> selectedInterests = [];
  final List<int> selectedHobbies = [];

  void toggleSelection(List<int> selectedList, int index) {
    setState(() {
      if (selectedList.contains(index)) {
        selectedList.remove(index);
      } else {
        selectedList.add(index);
      }
    });
  }

  bool get isNextButtonEnabled =>
      selectedInterests.isNotEmpty || selectedHobbies.isNotEmpty;
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
                          '3',
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
                    flex: 6, // 25% of the width
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
                text: "My Intrest",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Wrap(
                spacing: 12.0,
                runSpacing: 10.0,
                children: List.generate(interests.length, (index) {
                  return GestureDetector(
                    onTap: () => toggleSelection(selectedInterests, index),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedInterests.contains(index)
                            ? AppColors.yellowcolor
                            : AppColors.blackshade,
                        border: Border.all(color: AppColors.greycolor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        interests[index],
                        style: TextStyle(
                          color: selectedInterests.contains(index)
                              ? AppColors.whitecolor
                              : AppColors.greycolor,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalText(
                text: "My Hobbies",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Wrap(
                spacing: 12.0,
                runSpacing: 10.0,
                children: List.generate(hobbies.length, (index) {
                  return GestureDetector(
                    onTap: () => toggleSelection(selectedHobbies, index),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedHobbies.contains(index)
                            ? AppColors.yellowcolor
                            : AppColors.blackshade,
                        border: Border.all(color: AppColors.greycolor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        hobbies[index],
                        style: TextStyle(
                          color: selectedHobbies.contains(index)
                              ? AppColors.whitecolor
                              : AppColors.greycolor,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalButton(
                text: "Next",
                onPressed: isNextButtonEnabled
                    ? () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateAcc4(),
                            ));
                      }
                    : null,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
