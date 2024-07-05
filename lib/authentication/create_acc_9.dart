import 'package:enigmate/authentication/create_acc_10.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globalimagecomponent.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreateAcc9 extends StatefulWidget {
  const CreateAcc9({Key? key}) : super(key: key);

  @override
  State<CreateAcc9> createState() => _CreateAcc9State();
}

class _CreateAcc9State extends State<CreateAcc9> {
  List<File?> _images = List.filled(6, null);
  final ImagePicker _picker = ImagePicker();

  Future<void> _getImage(ImageSource source, int index) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _images[index] = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
      // You can show an error message to the user here
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images[index] = null;
    });
  }

  Widget _buildAddPhoto(int index) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 230,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.whitecolor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 20),
                      GlobalText(
                        text: "Upload Photos From",
                        color: AppColors.blackcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              _getImage(ImageSource.camera, index);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/Camera.png',
                                  scale: 3,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              _getImage(ImageSource.gallery, index);
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/My photos.png',
                                  scale: 3,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Container(
              height: 117,
              width: 102,
              decoration: BoxDecoration(
                color: AppColors.blackshade,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppColors.greycolor),
              ),
              child: _images[index] != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(
                        _images[index]!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    )
                  : Image.asset(
                      'assets/images/add_icon.png',
                      scale: 3,
                    ),
            ),
            if (_images[index] != null)
              Positioned(
                top: 5,
                right: 5,
                child: GestureDetector(
                  onTap: () => _removeImage(index),
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
          ],
        ),
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
            SizedBox(height: 35),
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
                  SizedBox(width: 125),
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
            SizedBox(height: 19),
            Container(
              height: 3,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Expanded(
                    flex: 26,
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
                    flex: 7,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalText(
                text: "Add Your Photo",
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalText(
                text: "Upload 6 Photos",
                color: AppColors.greycolor,
              ),
            ),
            SizedBox(height: 30),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildAddPhoto(0),
                    _buildAddPhoto(1),
                    _buildAddPhoto(2),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildAddPhoto(3),
                    _buildAddPhoto(4),
                    _buildAddPhoto(5),
                  ],
                ),
              ],
            ),
            SizedBox(height: 250),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GlobalButton(
                text: "Upload",
                onPressed: () {
                  if (_images.any((image) => image != null)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateAcc10(),
                      ),
                    );
                  } else {
                    // Show an error message or perform any other action
                    print('Please upload at least one photo');
                  }
                },
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
