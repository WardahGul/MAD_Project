import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Gynea_temp extends StatefulWidget {
  final String doctorId;
  final String patientId;

  Gynea_temp({required this.doctorId, required this.patientId});
  @override
  State<Gynea_temp> createState() => Gynea_tempState();
}

class Gynea_tempState extends State<Gynea_temp> {
  final t1 = TextEditingController();
  final t2 = TextEditingController();
  final t3 = TextEditingController();
  final t4 = TextEditingController();
  final t5 = TextEditingController();
  final t6 = TextEditingController();
  final t7 = TextEditingController();
  final t8 = TextEditingController();

  Future<void> savePatientHistory(
      String templateName, Map<String, dynamic> data) async {
    try {
      final CollectionReference doctorsCollection =
          FirebaseFirestore.instance.collection('doctors');
      final DocumentReference patientDocRef = doctorsCollection
          .doc(widget.doctorId)
          .collection('patients')
          .doc(widget.patientId);

      // Update or create a subcollection for patient history
      await patientDocRef
          .collection('patient_history')
          .doc(templateName)
          .set(data);
      print('Patient history saved successfully!');
    } catch (e) {
      print('Error saving patient history: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History",
          style: TextStyle(fontSize: 25.0),
        ),
        backgroundColor: Color(0xFF311B92),
        actions: [
          // Add a Save IconButton to the app bar
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final data = {
                  'Presenting Complaint': t1.text,
                  'History Of Presenting Complaint(HOPC)': t2.text,
                  'Systemic Inquiry': t3.text,
                  'Past History': t4.text,
                  'Family History': t5.text,
                  'Personal History': t6.text,
                  'Socioeconomical History': t7.text,
                  'Vaccination History': t8.text,
                };
                savePatientHistory('Gynea', data);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        "Data Saved"))); // Replace 'Surgery' with the template name
              }),
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
                      colors: [Colors.white, Colors.white]
                      //colors: [Colors.brown.shade200, Colors.brown.shade200]),
                      ),
                ),
                child: Center(
                  child: Column(children: [
                    SingleChildScrollView(
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(children: [
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  // border:
                                  //     Border.all(color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.deepPurple.shade200,
                                        Colors.deepPurple.shade500
                                      ]
                                      // colors: [Colors.teal, Colors.deepPurple],
                                      //colors: [Color(0xFFB39DDB), Color(0xFFD1C4E9)]
                                      ),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                // width: 500.0,
                                // height: 80.0,
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.11,
                                child: const ListTile(
                                    title: Text(
                                  "Presenting Complaint",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'MyCustomFont',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                  ),
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.deepPurple.shade100,
                                      Colors.deepPurple.shade200
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                // width: 500.0,
                                // height: 150.0, // Adjust the height as needed
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.3,
                                child: TextField(
                                  controller: t1,
                                  decoration: InputDecoration(
                                    hintText: "Write your text here...",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none, // Remove border
                                    enabledBorder: InputBorder
                                        .none, // Remove border when not focused
                                    focusedBorder: InputBorder
                                        .none, // Remove border when focused
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                  ),
                                  maxLines:
                                      null, // Allow multiple lines of text
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    // Handle the text input as needed
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 22.0),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  // border:
                                  //     Border.all(color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.deepPurple.shade200,
                                        Colors.deepPurple.shade500
                                      ]
                                      // colors: [Colors.teal, Colors.deepPurple],
                                      //colors: [Color(0xFFB39DDB), Color(0xFFD1C4E9)]
                                      ),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.11,
                                child: const ListTile(
                                    title: Text(
                                  "History Of Presenting Complaint(HOPC)",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'MyCustomFont',
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                  ),
                                )),
                              ),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.deepPurple.shade100,
                                      Colors.deepPurple.shade200
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.3,
                                child: TextField(
                                  controller: t2,
                                  decoration: InputDecoration(
                                    hintText: "Write your text here...",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none, // Remove border
                                    enabledBorder: InputBorder
                                        .none, // Remove border when not focused
                                    focusedBorder: InputBorder
                                        .none, // Remove border when focused
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                  ),
                                  maxLines:
                                      null, // Allow multiple lines of text
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    // Handle the text input as needed
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 22.0,
                            ),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  // border:
                                  //     Border.all(color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.deepPurple.shade200,
                                        Colors.deepPurple.shade500
                                      ]
                                      // colors: [Colors.teal, Colors.deepPurple],
                                      //colors: [Color(0xFFB39DDB), Color(0xFFD1C4E9)]
                                      ),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.11,
                                child: const ListTile(
                                    title: Text(
                                  "Systemic Inquiry",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'MyCustomFont',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  // textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.deepPurple.shade100,
                                      Colors.deepPurple.shade200
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.3,
                                child: TextField(
                                  controller: t3,
                                  decoration: InputDecoration(
                                    hintText: "Write your text here...",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none, // Remove border
                                    enabledBorder: InputBorder
                                        .none, // Remove border when not focused
                                    focusedBorder: InputBorder
                                        .none, // Remove border when focused
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                  ),
                                  maxLines:
                                      null, // Allow multiple lines of text
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    // Handle the text input as needed
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 22.0,
                            ),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  // border:
                                  //     Border.all(color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.deepPurple.shade200,
                                        Colors.deepPurple.shade500
                                      ]
                                      // colors: [Colors.teal, Colors.deepPurple],
                                      //colors: [Color(0xFFB39DDB), Color(0xFFD1C4E9)]
                                      ),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.11,
                                child: const ListTile(
                                    title: Text(
                                  "Past History",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'MyCustomFont',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  // textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.deepPurple.shade100,
                                      Colors.deepPurple.shade200
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.3,
                                child: TextField(
                                  controller: t4,
                                  decoration: InputDecoration(
                                    hintText: "Write your text here...",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none, // Remove border
                                    enabledBorder: InputBorder
                                        .none, // Remove border when not focused
                                    focusedBorder: InputBorder
                                        .none, // Remove border when focused
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                  ),
                                  maxLines:
                                      null, // Allow multiple lines of text
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    // Handle the text input as needed
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 22.0,
                            ),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  // border:
                                  //     Border.all(color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.deepPurple.shade200,
                                        Colors.deepPurple.shade500
                                      ]
                                      // colors: [Colors.teal, Colors.deepPurple],
                                      //colors: [Color(0xFFB39DDB), Color(0xFFD1C4E9)]
                                      ),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.11,
                                child: const ListTile(
                                    title: Text(
                                  "Family History",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'MyCustomFont',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  // textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.deepPurple.shade100,
                                      Colors.deepPurple.shade200
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.3,
                                child: TextField(
                                  controller: t5,
                                  decoration: InputDecoration(
                                    hintText: "Write your text here...",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none, // Remove border
                                    enabledBorder: InputBorder
                                        .none, // Remove border when not focused
                                    focusedBorder: InputBorder
                                        .none, // Remove border when focused
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                  ),
                                  maxLines:
                                      null, // Allow multiple lines of text
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    // Handle the text input as needed
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 22.0,
                            ),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  // border:
                                  //     Border.all(color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.deepPurple.shade200,
                                        Colors.deepPurple.shade500
                                      ]
                                      // colors: [Colors.teal, Colors.deepPurple],
                                      //colors: [Color(0xFFB39DDB), Color(0xFFD1C4E9)]
                                      ),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.11,
                                child: const ListTile(
                                    title: Text(
                                  "Personal History",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'MyCustomFont',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  // textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.deepPurple.shade100,
                                      Colors.deepPurple.shade200
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.3,
                                child: TextField(
                                  controller: t6,
                                  decoration: InputDecoration(
                                    hintText: "Write your text here...",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none, // Remove border
                                    enabledBorder: InputBorder
                                        .none, // Remove border when not focused
                                    focusedBorder: InputBorder
                                        .none, // Remove border when focused
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                  ),
                                  maxLines:
                                      null, // Allow multiple lines of text
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    // Handle the text input as needed
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 22.0,
                            ),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  // border:
                                  //     Border.all(color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.deepPurple.shade200,
                                        Colors.deepPurple.shade500
                                      ]
                                      // colors: [Colors.teal, Colors.deepPurple],
                                      //colors: [Color(0xFFB39DDB), Color(0xFFD1C4E9)]
                                      ),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.11,
                                child: const ListTile(
                                    title: Text(
                                  "Socioeconomical History",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'MyCustomFont',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  // textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.deepPurple.shade100,
                                      Colors.deepPurple.shade200
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.3,
                                child: TextField(
                                  controller: t7,
                                  decoration: InputDecoration(
                                    hintText: "Write your text here...",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none, // Remove border
                                    enabledBorder: InputBorder
                                        .none, // Remove border when not focused
                                    focusedBorder: InputBorder
                                        .none, // Remove border when focused
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                  ),
                                  maxLines:
                                      null, // Allow multiple lines of text
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    // Handle the text input as needed
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 22.0,
                            ),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  // border:
                                  //     Border.all(color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.deepPurple.shade200,
                                        Colors.deepPurple.shade500
                                      ]
                                      // colors: [Colors.teal, Colors.deepPurple],
                                      //colors: [Color(0xFFB39DDB), Color(0xFFD1C4E9)]
                                      ),
                                ),
                                padding: const EdgeInsets.all(10.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.11,
                                child: const ListTile(
                                    title: Text(
                                  "Vaccination History",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'MyCustomFont',
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.normal,
                                  ),
                                  // textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                            SizedBox(height: 12.0),
                            Card(
                              color: Colors.transparent,
                              elevation: 0,
                              margin: EdgeInsets.zero,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                      color: Colors.deepPurple, width: 2.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.deepPurple.shade100,
                                      Colors.deepPurple.shade200
                                    ],
                                  ),
                                ),
                                padding: const EdgeInsets.all(16.0),
                                width: screensize.width * 0.95,
                                height: screensize.height * 0.3,
                                child: TextField(
                                  controller: t8,
                                  decoration: InputDecoration(
                                    hintText: "Write your text here...",
                                    hintStyle: TextStyle(color: Colors.white),
                                    border: InputBorder.none, // Remove border
                                    enabledBorder: InputBorder
                                        .none, // Remove border when not focused
                                    focusedBorder: InputBorder
                                        .none, // Remove border when focused
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23.0,
                                  ),
                                  maxLines:
                                      null, // Allow multiple lines of text
                                  keyboardType: TextInputType.multiline,
                                  onChanged: (value) {
                                    // Handle the text input as needed
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
