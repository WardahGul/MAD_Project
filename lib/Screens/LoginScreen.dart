import 'package:final_project/Screens/MyHomePage.dart';
import 'package:final_project/Screens/Registration.dart';
import 'package:final_project/database/firebase_auth.dart';
import 'package:final_project/uiDesigns/WaveClipper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final _formkey = GlobalKey<FormState>();
    final AuthService authService = AuthService();
    TextEditingController emailCont = TextEditingController();
    TextEditingController passCont = TextEditingController();

    signIn() async {
      try {
        final User? user = await authService.signIn(
          emailCont.text,
          passCont.text,
        );

        if (user != null) {
          final userDetails = await authService.getUserDetails(user.email!);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => MyHomePage(
                authService: authService,
                userDetails: userDetails,
              ),
            ),
          );
        } else {
          // Handle the case where the user does not exist or credentials are incorrect
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  "Invalid credentials. Please check your email and password."),
              backgroundColor: Colors.deepPurpleAccent,
            ),
          );
        }
      } catch (e) {
        // Handle other exceptions (e.g., network issues)
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("An error occurred. Please try again later."),
            backgroundColor: Colors.deepPurpleAccent,
          ),
        );
      }
    }

    return Scaffold(
      body: Center(
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFD1C4E9), Color(0xFF311B92)],
              ),
            ),
            child: ClipPath(
              clipper: SingleWaveClipper(),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white, // Color of the clipped area (background)
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              width: screenWidth < 600 ? screenWidth : 600, // Responsive width
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/login.png', // Replace with your image asset path
                      width: 250, // Adjust the width as needed
                      height: 250, // Adjust the height as needed
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextFormField(
                      controller: emailCont,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some value';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: passCont,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        icon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter some value';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          signIn();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16), // Button padding
                        backgroundColor: const Color(0xFF4749a0),
                        foregroundColor:
                            Colors.white, // Button background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RegistrationScreen()));
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Colors.deepPurpleAccent),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
