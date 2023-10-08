import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Screens/PatientHistory.dart';
import 'package:flutter/material.dart';

class PatientBioDataForm extends StatefulWidget {
  final String doctorId; // Add doctorId parameter

  PatientBioDataForm({required this.doctorId});
  @override
  _PatientBioDataFormState createState() => _PatientBioDataFormState();
}

class _PatientBioDataFormState extends State<PatientBioDataForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _birthdateController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _professionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Bio Data Form'),
        backgroundColor: Color(0xFF311B92),
        actions: [
          // Add a Save IconButton to the app bar
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  // Define a map containing the patient's data
                  final patientData = {
                    'name': _nameController.text,
                    'gender': _genderController.text,
                    'birthdate': _birthdateController.text,
                    'age': int.parse(_ageController.text),
                    'address': _addressController.text,
                    'phone': _phoneController.text,
                    'email': _emailController.text,
                    'profession': _professionController.text,
                  };

                  // Save patient data in the specific doctor's subcollection
                  await FirebaseFirestore.instance
                      .collection("doctors")
                      .doc(widget.doctorId) // Use the doctor's ID
                      .collection("patients")
                      .add(patientData);

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Patients_history(
                                patientId: _nameController.text,
                                doctorId: widget.doctorId,
                              )));
                }
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: 'Name', icon: Icon(Icons.person)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _genderController,
                  decoration: InputDecoration(
                      labelText: 'Gender', icon: Icon(Icons.accessibility)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your gender';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _birthdateController,
                  decoration: InputDecoration(
                      labelText: 'Birthdate', icon: Icon(Icons.date_range)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your birthdate';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(
                    labelText: 'Age',
                    hintText: 'Enter your age',
                    icon: Icon(Icons.accessibility),
                  ),
                  keyboardType: TextInputType.number, // Accepts only numbers
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your age';
                    }
                    // You can add additional validation logic for integer here
                    if (int.tryParse(value) == null) {
                      return 'Please enter a valid age';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    icon: Icon(Icons.location_on),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      labelText: 'Phone', icon: Icon(Icons.phone)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email', icon: Icon(Icons.email)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _professionController,
                  decoration: InputDecoration(
                      labelText: 'Profession', icon: Icon(Icons.work)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your profession';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
