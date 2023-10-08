import 'package:final_project/Screens/PatientHistory.dart';
import 'package:final_project/Screens/SplashScreen.dart';
import 'package:final_project/database/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MED-Chronicle',
      theme: ThemeData(
        primaryColor: Colors.purple[100],
        fontFamily: 'Roboto',
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF4749a0))),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color(0xFF4749a0)), // Blue color for border
            ),
            labelStyle: TextStyle(color: const Color(0xFF4749a0)),
            iconColor: Color(0xFF4749a0) // Blue color for label
            ),
      ),
      home: SplashScreen(),
    );
  }
}
