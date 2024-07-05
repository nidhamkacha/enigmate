import 'package:enigmate/authentication/create_acc_2.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:flutter/material.dart';

class CreateAcc1 extends StatefulWidget {
  const CreateAcc1({super.key});

  @override
  State<CreateAcc1> createState() => _CreateAcc1State();
}

class _CreateAcc1State extends State<CreateAcc1> {
  int? selectedIndex;
  int? secondselectedIndex;
  String? selectedRelationship;
  String? selectedchildern;

  bool validateInputs() {
    if (selectedIndex == null ||
        secondselectedIndex == null ||
        selectedRelationship == null ||
        selectedchildern == null) {
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

  final List<Map<String, String>> items = [
    {'image': 'assets/images/icon_Female.png', 'text': 'Female'},
    {'image': 'assets/images/icon_male.png', 'text': 'Male'},
    {'image': 'assets/images/icon_trans.png', 'text': 'Trans'},
    {'image': 'assets/images/icon_unsure.png', 'text': 'Unsure'},
  ];
  final List<Map<String, String>> seconditems = [
    {'image': 'assets/images/icon_Female.png', 'text': 'Female'},
    {'image': 'assets/images/icon_male.png', 'text': 'Male'},
    {'image': 'assets/images/icon_trans.png', 'text': 'Trans'},
    {'image': 'assets/images/icon_unsure.png', 'text': 'Unsure'},
  ];

  final List<String> relationships = [
    'Single',
    'Commited',
    'Married',
    'Committed But Looking',
    'Married But Looking'
  ];
  final List<String> childerns = [
    'Does’t have kids but might\nwant them',
    'Doesn’t have kids but wants\nthem',
    'Doesn’t have kids and doesn’t\nwant',
    'Has a kid(s) and doesn’t want\nmore',
    'Has a kid(s) and might more',
    'Has a kid(s) and wants more'
  ];

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
                          '1',
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
                  flex: 2, // 25% of the width
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
              text: "I am a",
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
                                : Color(0xFFD99E10),
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
            child: GlobalText(
              text: "I am a Looking For",
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: seconditems.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    secondselectedIndex = index;
                  });
                },
                child: Column(
                  children: [
                    Container(
                      height: 55,
                      width: 260,
                      decoration: BoxDecoration(
                        color: secondselectedIndex == index
                            ? Color(0xFFD99E10)
                            : AppColors.blackshade,
                        border: Border.all(color: AppColors.greycolor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            seconditems[index]['image'].toString(),
                            color: secondselectedIndex == index
                                ? AppColors.whitecolor
                                : Color(0xFFD99E10),
                            scale: 3,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GlobalText(
                            text: seconditems[index]['text'],
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
            child: GlobalText(
              text: "Relationship Status",
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Container(
              height: 330,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.blackshade,
                border: Border.all(color: AppColors.greycolor),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: relationships.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedRelationship = relationships[index];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GlobalText(
                              text: relationships[index],
                              color:
                                  selectedRelationship == relationships[index]
                                      ? AppColors.whitecolor
                                      : AppColors.greycolor,
                            ),
                            Radio<String>(
                              value: relationships[index],
                              groupValue: selectedRelationship,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedRelationship = value;
                                });
                              },
                              activeColor: AppColors
                                  .yellowcolor, // Change to your desired color
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: AppColors.greycolor,
                    height: 1,
                    endIndent: 35,
                    indent: 25,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GlobalText(
              text: "Children",
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.blackshade,
                border: Border.all(color: AppColors.greycolor),
                borderRadius: BorderRadius.circular(25),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: childerns.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedchildern = childerns[index];
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GlobalText(
                              text: childerns[index],
                              color: selectedchildern == childerns[index]
                                  ? AppColors.whitecolor
                                  : AppColors.greycolor,
                            ),
                            Radio<String>(
                              value: childerns[index],
                              groupValue: selectedchildern,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedchildern = value;
                                });
                              },
                              activeColor: AppColors
                                  .yellowcolor, // Change to your desired color
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: AppColors.greycolor,
                    height: 1,
                    endIndent: 35,
                    indent: 25,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: GlobalButton(
              text: "next",
              onPressed: () {
                if (validateInputs()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateAcc2(),
                    ),
                  );
                } else {
                  showErrorSnackBar(
                      'Please select all fields before proceeding.');
                }
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    ));
  }
}
