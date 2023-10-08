import 'package:final_project/Screens/Introduction.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false; // To control the visibility of the image

  @override
  void initState() {
    super.initState();
    // Trigger the animation after a delay
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _visible = true; // Show the image
      });
    });

    // Navigate to the next screen after another delay
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroductionPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Spicy background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF311B92), Color(0xFFD1C4E9)],
              ),
            ),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(seconds: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'Assets/medical-checkup.png',
                    height: screenHeight * 0.3, // Adjust image height
                    color: Colors.white,
                  ),
                  SizedBox(height: screenHeight * 0.02), // Adjust spacing
                  Text(
                    'Med Chronicle',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08, // Adjust font size
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
