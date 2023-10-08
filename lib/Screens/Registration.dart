import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Screens/MyHomePage.dart';
import 'package:final_project/database/firebase_auth.dart';
import 'package:final_project/uiDesigns/WaveClipper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  TextEditingController nameCont = TextEditingController();
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();
  CollectionReference doctors =
      FirebaseFirestore.instance.collection("doctors");

  signUp() async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailCont.text,
        password: passCont.text,
      );

      if (userCredential.user != null) {
        // Registration successful, proceed with saving data to Firestore
        doctors.add({
          "name": nameCont.text,
          "email": emailCont.text,
          "password": passCont.text,
        });

        final userDetails = {
          "name": nameCont.text,
          "email": emailCont.text,
          "password": passCont.text,
        };

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MyHomePage(authService: authService, userDetails: userDetails),
          ),
        );
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  "Email is already in use. Please use a different email."),
              backgroundColor: Colors.deepPurpleAccent,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Registration failed. Please try again."),
              backgroundColor: Colors.deepPurpleAccent,
            ),
          );
        }
      } else {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/registration.png', // Replace with your image asset path
                    width: 250, // Adjust the width as needed
                    height: 200, // Adjust the height as needed
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: nameCont,
                    decoration: const InputDecoration(
                        labelText: 'Name', icon: Icon(Icons.account_box)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailCont,
                    decoration: const InputDecoration(
                        labelText: 'Email', icon: Icon(Icons.email)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passCont,
                    decoration: const InputDecoration(
                        labelText: 'Password', icon: Icon(Icons.lock)),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 16), // Button padding
                      backgroundColor: const Color(0xFF4749a0),
                      foregroundColor: Colors.white, // Button background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      signUp();
    }
  }
}
