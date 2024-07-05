import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/homescreen/home_screen.dart';
import 'package:flutter/material.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
          HomeScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        color: AppColors.blackcolor,
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem('assets/images/bottom_home.png', 0),
            _buildNavItem('assets/images/bottom_reels.png', 1),
            _buildNavItem('assets/images/bottom_search.png', 2),
            _buildNavItem('assets/images/bottom_message.png', 3),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: AppColors.yellowcolor,
        child: Icon(Icons.add, color: AppColors.whitecolor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget _buildNavItem(String asset, int index) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            Container(
              width: 50,
              height: 3,
              margin: EdgeInsets.only(bottom: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
                color: AppColors.yellowcolor,
              ),
            ),
          SizedBox(
            height: 5,
          ),
          Image.asset(
            asset,
            scale: 2.5,
            color: isSelected ? AppColors.yellowcolor : Colors.grey,
          ),
        ],
      ),
    );
  }
}
