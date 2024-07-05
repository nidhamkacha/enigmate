import 'package:enigmate/authentication/create_acc_3.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:enigmate/global/globatextfield.dart';
import 'package:flutter/material.dart';

class CreateAcc2 extends StatefulWidget {
  const CreateAcc2({super.key});

  @override
  State<CreateAcc2> createState() => _CreateAcc2State();
}

class _CreateAcc2State extends State<CreateAcc2> {
  String? selectedCountry;
  final TextEditingController _cityController = TextEditingController();
  final List<String> countries = [
    'United States',
    'Canada',
    'Mexico',
    'United Kingdom',
    'Germany',
    'France',
    'Italy',
    'Spain',
    'Australia',
    'Japan',
    // Add more countries as needed
  ];
  bool validateInputs() {
    if (selectedCountry == null || _cityController.text.trim().isEmpty) {
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
                          '2',
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
                    flex: 4, // 25% of the width
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFD99E10),
                            Color(0xFFFFC946),
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
                text: "Where is your Current\nLocation?",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  hintText: 'Country',

                  hintStyle: TextStyle(color: AppColors.greycolor),
                  // suffixIcon: Icon(Icons.arrow_drop_down_sharp),
                  filled: true,
                  fillColor: AppColors.blackshade,

                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.yellowcolor),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                value: selectedCountry,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
                items: countries.map((country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(
                      country,
                      style: TextStyle(
                        color: AppColors.whitecolor,
                      ),
                    ),
                  );
                }).toList(),
                dropdownColor: AppColors.blackshade,
                borderRadius: BorderRadius.circular(30),
                elevation: 0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalTextfield(
                hintText: "City",
                controller: _cityController,
              ),
            ),
            SizedBox(
              height: 400,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalButton(
                text: "Next",
                onPressed: () {
                  if (validateInputs()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateAcc3()));
                  } else {
                    showErrorSnackBar(
                        'Please select a country and enter a city before proceeding.');
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
