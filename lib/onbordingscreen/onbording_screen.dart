import 'package:enigmate/authentication/login_screen.dart';
import 'package:enigmate/global/globalbutton.dart';
import 'package:enigmate/global/globaltext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.ease,
            color: Colors.transparent,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildPage(
                  context,
                  title: "Find Your\nSpecial Someone",
                  subtitle: "With Our New Exciting Features",
                  path: 'assets/images/first_onbording.png',
                  showSkip: true,
                ),
                _buildPage(
                  context,
                  title: "More Profiles,\nMore Dates",
                  subtitle: "Connecting you with more profiles",
                  path: 'assets/images/second_onbording.png',
                  showSkip: true,
                ),
                _buildPage(
                  context,
                  title: "Interact Around\nThe World",
                  subtitle: "Send direct message to your matches",
                  path: 'assets/images/first_onbording.png',
                  showSkip: true,
                ),
                _buildPage(
                  context,
                  title: "Hire Profile\nNear You",
                  subtitle: "Explore nearest interested people to get hired",
                  path: 'assets/images/third_onbording.png',
                  showSkip: false, // Hide Skip text on the last page
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 90.0),
                  child: _buildIndicator(),
                ),
                SizedBox(height: 20),
                _currentPage == 3
                    ? GlobalButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        text: "Start Dating",
                      )
                    : GlobalButton(
                        onPressed: () {
                          setState(() {
                            _currentPage = _currentPage + 1;
                          });
                          _pageController.animateToPage(
                            _currentPage,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        text: "Next",
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(BuildContext context,
      {required String title,
      required String subtitle,
      required String path,
      required bool showSkip}) {
    return Container(
      padding: EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showSkip)
            InkWell(
              onTap: () {
                _skipToLastPage();
              },
              child: Align(
                alignment: Alignment.topRight,
                child: GlobalText(
                  text: "Skip",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          SizedBox(height: 20),
          Image.asset(
            '$path',
            fit: BoxFit.fill,
            scale: 2,
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Text(
              '$title',
              style: GoogleFonts.abrilFatface(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: GlobalText(text: '$subtitle'),
          )
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    double progress = (_currentPage + 1) / 4;
    return Container(
      width: double.infinity,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(2.5),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: progress,
          child: Container(
            height: 5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFD99E10), // #D99E10
                  Color(0xFFFFC946), // #FFC946
                ],
              ),
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
        ),
      ),
    );
  }

  void _skipToLastPage() {
    setState(() {
      _currentPage = 3;
    });
    _pageController.animateToPage(
      3,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
