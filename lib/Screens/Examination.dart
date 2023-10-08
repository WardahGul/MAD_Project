import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Examination extends StatefulWidget {
  final String doctorId;
  final String patientId;
  const Examination({required this.doctorId, required this.patientId});
  @override
  State<Examination> createState() => ExaminationState();
}

class ExaminationState extends State<Examination> {
  final TextEditingController t1 = TextEditingController();
  final TextEditingController t2 = TextEditingController();
  final TextEditingController t3 = TextEditingController();
  final TextEditingController t4 = TextEditingController();
  final TextEditingController t5 = TextEditingController();
  final TextEditingController t6 = TextEditingController();
  final TextEditingController t7 = TextEditingController();
  final TextEditingController t8 = TextEditingController();

  Future<void> savePatientHistory(
      // ignore: non_constant_identifier_names
      String Name,
      Map<String, dynamic> data) async {
    try {
      final CollectionReference doctorsCollection =
          FirebaseFirestore.instance.collection('doctors');
      final DocumentReference patientDocRef = doctorsCollection
          .doc(widget.doctorId)
          .collection('patients')
          .doc(widget.patientId);

      // Update or create a subcollection for patient history
      await patientDocRef.collection('patient_history').doc(Name).set(data);
      print('Patient history saved successfully!');
    } catch (e) {
      print('Error saving patient history: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Examinations",
          style: TextStyle(fontSize: 25.0),
        ),
        backgroundColor: const Color(0xFF311B92),
        actions: [
          // Add a Save IconButton to the app bar
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              final data = {
                'examine': t2.text,
              };
              savePatientHistory('examination', data);
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Data Saved")));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.white, Colors.white],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 15.0),
                                  Card(
                                    color: Colors.transparent,
                                    elevation: 0,
                                    margin: EdgeInsets.zero,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.deepPurple.shade200,
                                            Colors.deepPurple.shade500,
                                          ],
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(10.0),
                                      width: screenSize.width * 0.95,
                                      height: screenSize.height * 0.11,
                                      child: const ListTile(
                                        title: Text(
                                          "Examination",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'MyCustomFont',
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 22.0,
                                  ),
                                  Card(
                                    color: Colors.transparent,
                                    elevation: 0,
                                    margin: EdgeInsets.zero,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: Colors.deepPurple,
                                          width: 2.0,
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.deepPurple.shade100,
                                            Colors.deepPurple.shade200,
                                          ],
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(16.0),
                                      width: screenSize.width * 0.95,
                                      height: screenSize.height * 0.6,
                                      child: TextField(
                                        controller: t2,
                                        decoration: const InputDecoration(
                                          hintText: "Write here...",
                                          hintStyle: TextStyle(
                                            color: Colors.white,
                                          ),
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        ),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 23.0,
                                        ),
                                        maxLines: null,
                                        keyboardType: TextInputType.multiline,
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 22.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
