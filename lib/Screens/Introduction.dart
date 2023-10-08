import 'dart:async';

import 'package:final_project/Screens/LoginScreen.dart';
import 'package:final_project/uiDesigns/WaveClipper.dart';
import 'package:flutter/material.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // To keep track of the current page
  Timer? _timer;

  final List<String> galleryImages = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
    _startImageSlider();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startImageSlider() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_currentPage < galleryImages.length - 1) {
        _pageController.animateToPage(_currentPage + 1,
            duration: Duration(milliseconds: 5), curve: Curves.ease);
      } else {
        _pageController.animateToPage(0,
            duration: Duration(milliseconds: 5), curve: Curves.ease);
      }
    });
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(galleryImages.length, (index) {
        return Container(
          width: 10.0,
          height: 10.0,
          margin: const EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.white : Colors.purple[100],
            border: Border.all(
              width: 1.0,
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFD1C4E9), Color(0xFF311B92)],
              ),
            ),
            child: ClipPath(
              clipper: WaveClipper(),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white, // Color of the clipped area (background)
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome to Med Chronicle',
                style: TextStyle(
                  fontSize: screenWidth * 0.06, // Adjust font size
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4749a0),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Your Ultimate Medical Record-Keeping App',
                style: TextStyle(
                  fontSize: screenWidth * 0.04, // Adjust font size
                  color: Color(0xFF4749a0),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.3, // Adjust the height as needed
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: galleryImages.length,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width:
                              screenWidth * 0.8, // Adjust the width as needed
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              galleryImages[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              _buildDots(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: ((context) => LoginPage())));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.1,
                      vertical: screenHeight * 0.02), // Adjust padding
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF4749a0),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04, // Adjust font size
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
