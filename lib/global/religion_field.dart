import 'package:enigmate/common/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegionField extends StatefulWidget {
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;

  const RegionField({
    Key? key,
    this.hintText,
    this.errorText,
    this.controller,
  }) : super(key: key);

  @override
  State<RegionField> createState() => _RegionFieldState();
}

class _RegionFieldState extends State<RegionField> {
  String? selectedRegion;
  final List<String> religions = [
    'Hinduism',
    'Christianity',
    'Buddhism',
    'Islam',
    'Jain'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.blackshade,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.whitecolor),
            borderRadius: BorderRadius.circular(30),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.yellowcolor),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
        dropdownColor: AppColors.blackshade,
        style: GoogleFonts.dmSans(color: Colors.white),
        hint: Text(
          'Select Region',
          style: GoogleFonts.dmSans(color: AppColors.greycolor),
        ),
        value: selectedRegion,
        items: religions.map((String region) {
          return DropdownMenuItem<String>(
            value: region,
            child: Text(region),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedRegion = newValue;
            widget.controller?.text = newValue ?? '';
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return widget.errorText;
          }
          return null;
        },
      ),
    );
  }
}