import 'package:enigmate/authentication/create_acc_8.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:enigmate/global/globatextfield.dart';
import 'package:flutter/material.dart';

class CreateAcc7 extends StatefulWidget {
  const CreateAcc7({super.key});

  @override
  State<CreateAcc7> createState() => _CreateAcc7State();
}

class _CreateAcc7State extends State<CreateAcc7> {
  final List<String> categories = [
    'Wedding',
    'Birthday',
    'Parties',
    'Cinema',
    'Concert',
    'Walking',
    'Dinner',
    'Coffee',
    'Cultural event',
    'Sports event',
    'Art exhibition',
    'Museum',
    'Theme park',
    'Festival',
    'Road trip',
    'Shopping trip',
    'Outdoor adventure',
    'Beach or nature trip',
    'Wine tasting events',
    'Charity event',
    'Adventure sports',
    'Book clubs or literary events',
    'Cooking or baking classes',
    'Media',
    'Science or technology exhibitions',
    'Karaoke or singing events',
    'Board game nights',
    'Travel with me',
    'Cultural food or drink events',
    'Other'
  ];

  bool _isSwitched = false;
  double _annualIncome = 50;
  final List<int> selectedIndexes = [];
  final TextEditingController _priceController = TextEditingController();

  void toggleSelection(int index) {
    setState(() {
      if (selectedIndexes.contains(index)) {
        selectedIndexes.remove(index);
      } else {
        selectedIndexes.add(index);
      }
    });
  }

  bool get isNextButtonEnabled =>
      selectedIndexes.isNotEmpty &&
      (!_isSwitched || (_isSwitched && _priceController.text.isNotEmpty));

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  void _validateAndContinue() {
    if (_isSwitched && _priceController.text.isEmpty) {
      // _showErrorDialog('You must enter a hiring price if you are available for hiring.');
      var snackBar = SnackBar(
          content: Text(
              'You must enter a hiring price if you are available for hiring.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    if (selectedIndexes.isEmpty) {
      // _showErrorDialog('You must select at least one category.');
      var snackBar =
          SnackBar(content: Text('You must select at least one category.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateAcc8(),
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
                          '9',
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
                    flex: 18, // 25% of the width
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
              child: Row(
                children: [
                  GlobalText(
                    text: "I am available for hiring",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Switch(
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                      });
                    },
                    activeColor: AppColors.yellowcolor,
                    thumbColor: WidgetStatePropertyAll(AppColors.whitecolor),
                    inactiveThumbColor: AppColors.yellowcolor,
                    inactiveTrackColor: Colors.grey[300],
                  ),
                ],
              ),
            ),
            if (_isSwitched) ...[
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GlobalTextfield(
                  hintText: "Hiring Price",
                  controller: _priceController,
                ),
              ),
            ],
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalText(
                color: AppColors.greycolor,
                text: "Available Distance",
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.blackshade,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColors.greycolor)),
                child: Stack(
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
                        max: 70,
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
                      left: 15 +
                          (_annualIncome / 70) *
                              (MediaQuery.of(context).size.width - 90),
                      bottom: 58,
                      child: Text(
                        '${_annualIncome.toStringAsFixed(0)}KM',
                        style: const TextStyle(
                          color: AppColors.whitecolor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalText(
                color: AppColors.greycolor,
                text: "Select Category",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Wrap(
                spacing: 12.0,
                runSpacing: 10.0,
                children: List.generate(categories.length, (index) {
                  return GestureDetector(
                    onTap: () => toggleSelection(index),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedIndexes.contains(index)
                            ? AppColors.yellowcolor
                            : AppColors.blackshade,
                        border: Border.all(color: AppColors.greycolor),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: selectedIndexes.contains(index)
                              ? AppColors.whitecolor
                              : AppColors.greycolor,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalButton(
                text: "Continue",
                onPressed: _validateAndContinue,
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
