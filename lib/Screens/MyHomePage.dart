import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Screens/LoginScreen.dart';
import 'package:final_project/Screens/PatientData.dart';
import 'package:final_project/Screens/PatientHistory.dart';
import 'package:final_project/database/firebase_auth.dart';
import 'package:final_project/models/patients.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.authService, this.userDetails});
  final AuthService authService;
  final Map<String, dynamic>? userDetails;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Future<void> _signOut(BuildContext context) async {
      try {
        await AuthService.signOut();
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginPage(), // Replace with your login page
          ),
        );
      } catch (e) {
        print('Sign-out failed: $e');
      }
    }

    Future<void> _deletePatient(String patientId) async {
      try {
        await FirebaseFirestore.instance
            .collection("doctors")
            .doc('${widget.userDetails?['email'] ?? ""}')
            .collection("patients")
            .doc(patientId)
            .delete();
      } catch (e) {
        print('Error deleting patient: $e');
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Med-Chronicle"),
        backgroundColor: Color(0xFF4749a0),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement your search functionality here
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Search action clicked'),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF4749a0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    // Display user profile picture here, if available
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 60,
                      color: Color(0xFF4749a0),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Display user's name and email, fetched from your database
                  Text(
                    widget.userDetails?['name'] ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.userDetails?['email'] ?? "",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Navigate to the settings screen or perform settings-related action
                Navigator.pop(context); // Close the drawer
                // Add your navigation logic here
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () async {
                _signOut(context);
              },
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("doctors")
            .doc('${widget.userDetails?['email'] ?? ""}') // Use the doctor's ID
            .collection("patients")
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final patientDocs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: patientDocs.length,
            itemBuilder: (context, index) {
              final patientData =
                  patientDocs[index].data() as Map<String, dynamic>;
              final patient = Patient(
                name: patientData['name'],
                age: patientData['age'],
                email: patientData['email'],
                // Add more fields as needed
              );

              return Card(
                elevation: 3,
                surfaceTintColor: Color(0xFFD1C4E9),
                child: ListTile(
                  minVerticalPadding: 3.0,
                  title: Text(patient.name),
                  subtitle: Text('Age: ${patient.age}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        color: Color(0xFF4749a0),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Patients_history(
                                        patientId: patient.name,
                                        doctorId:
                                            '${widget.userDetails?['email'] ?? ""}',
                                      )));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Color(0xFF4749a0),
                        onPressed: () {
                          _deletePatient(patientDocs[index].id);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF4749a0),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PatientBioDataForm(
                      doctorId: '${widget.userDetails?['email'] ?? ""}')));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
