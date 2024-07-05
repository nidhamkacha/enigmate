import 'package:enigmate/profilescreen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:enigmate/common/app_color.dart';
import 'package:enigmate/global/globaltext.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<buildProfileCard> profiles = [
    buildProfileCard(),
    buildProfileCard(),
    buildProfileCard(),
    buildProfileCard(),
  ];
  PageController _pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              _buildHeader(),
              Expanded(
                child: PageView(
                  onPageChanged: (value) {
                    _pageController.animateToPage(value,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut);
                  },
                  children: profiles,
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
            },
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/Profile Img.png'),
                  radius: 20,
                ),
                SizedBox(width: 8),
                GlobalText(
                  text: "juliana_evans",
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/search.png', scale: 3),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/images/icon_like.png',
                scale: 3,
              ),
              SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/images/filter.png',
                scale: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class buildProfileCard extends StatefulWidget {
  const buildProfileCard({super.key});

  @override
  State<buildProfileCard> createState() => _buildProfileCardState();
}

class _buildProfileCardState extends State<buildProfileCard> {
  PageController _imgPageController = PageController();

  int _currentImgPage = 0;

  List<String> imageslist = [
    'assets/images/homescreen_img.png',
    'assets/images/homescreen_img.png',
    'assets/images/homescreen_img.png',
    'assets/images/homescreen_img.png',
  ];

  @override
  void initState() {
    super.initState();
    _imgPageController.addListener(() {
      setState(() {
        _currentImgPage = _imgPageController.page!.round();
      });
    });
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < imageslist.length; i++) {
      indicators.add(
        Container(
          width: 45,
          height: 3,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _currentImgPage == i
                ? AppColors.whitecolor
                : AppColors.greycolor,
          ),
        ),
      );
    }
    return indicators;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Container(
        height: 400,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.yellowcolor),
          color: AppColors.blackshade,
        ),
        child: Stack(
          children: [
            Stack(
              children: [
                Container(
                  height: 450,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: PageView.builder(
                      itemCount: imageslist.length,
                      controller: _imgPageController,
                      itemBuilder: (context, index) {
                        return Image.asset(
                          imageslist[index],
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 360, // Adjust the top position of the row
              left: 25,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/Like (1).png',
                    scale: 3,
                  ),
                  Image.asset(
                    'assets/images/Like (2).png',
                    scale: 3,
                  ),
                  Image.asset(
                    'assets/images/Like (3).png',
                    scale: 3,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Colors.black.withOpacity(
                      0.5), // Adjust the opacity and color as needed
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 25,
                      blurRadius: 15,
                      offset: Offset(0, 10), // Adjust the shadow position
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GlobalText(
                            text: "Jack Evans,24",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                          Image.asset(
                            'assets/images/Blue_Tick.png',
                            scale: 2,
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Image.asset(
                            'assets/images/icn_rate.png',
                            scale: 2,
                          ),
                          GlobalText(
                            text: "4.2",
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GlobalText(
                            text: "jack_evans",
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greycolor,
                          ),
                          Image.asset(
                            'assets/images/icn_Handicap.png',
                            scale: 3,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          GlobalText(
                            text: "Available For Hiring • 3 km away",
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Image.asset('assets/images/karma point.png',
                              scale: 3),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 24,
                            width: 94,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: AppColors.yellowcolor)),
                            child: Center(
                              child: GlobalText(
                                text: "5K+ Match",
                                fontSize: 14,
                                color: AppColors.yellowcolor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 24,
                            width: 94,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(color: AppColors.yellowcolor)),
                            child: Center(
                              child: GlobalText(
                                text: "VIP User",
                                fontSize: 14,
                                color: AppColors.yellowcolor,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
