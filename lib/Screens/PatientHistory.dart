import 'package:final_project/Screens/Examination.dart';
import 'package:final_project/Screens/LabTests.dart';
import 'package:final_project/Screens/OtherNotes.dart';
import 'package:final_project/Screens/Prescription.dart';
import 'package:final_project/Screens/RadiologyReports.dart';
import 'package:final_project/Screens/WholeProfile.dart';
import 'package:final_project/templates/templates.dart';
import 'package:flutter/material.dart';

class Patients_history extends StatefulWidget {
  final String patientId;
  final String doctorId;

  Patients_history({required this.patientId, required this.doctorId});
  @override
  State<Patients_history> createState() => _Patients_historyState();
}

class _Patients_historyState extends State<Patients_history> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text(widget.patientId),
        backgroundColor: Color(0xFF311B92),
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white, Colors.white]),
            ),
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
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
                                ]),
                          ),
                          padding: const EdgeInsets.all(16.0),
                          width: screenSize.width * 1,
                          height: screenSize.height * 0.15,
                          child: ListTile(
                            title: const Column(
                              children: [
                                // Image(
                                //   image: AssetImage("assets/done.png"),
                                //   width:
                                //       25.0, // Adjust the width of the image as needed
                                //   height:
                                //       50.0, // Adjust the height of the image as needed
                                //   // You can also set other properties like fit, alignment, etc.
                                // ),
                                Center(
                                  child: Text(
                                    "Whole Profile",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'MyCustomFont',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => WholeProfile(
                                    patientId: widget.patientId,
                                    doctorId: widget.doctorId,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(
                              child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.deepPurple.shade300,
                                      Colors.deepPurple.shade700
                                    ]),
                              ),
                              // padding: EdgeInsets.all(40.0),
                              width: 140.0,
                              height: 140.0,
                              child: ListTile(
                                title: const Column(
                                  children: [
                                    // Image(
                                    //   image:
                                    //       AssetImage("assets/medical-report.png"),
                                    //   width:
                                    //       24.0, // Adjust the width of the image as needed
                                    //   height:
                                    //       24.0, // Adjust the height of the image as needed
                                    //   // You can also set other properties like fit, alignment, etc.
                                    // ),
                                    Text(
                                      'History',
                                      style: TextStyle(
                                        color: Colors.white,
                                        // fontFamily: 'MyCustomFont',
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(40.0),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => Templates(
                                        patientId: widget.patientId,
                                        doctorId: widget.doctorId,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          )),
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.deepPurple.shade300,
                                      Colors.deepPurple.shade800
                                    ]
                                    //colors: [Color(0xFFB39DDB), Color(0xFFD1C4E9)]
                                    ),
                              ),
                              width: 140.0,
                              height: 140.0,
                              child: ListTile(
                                title: const Column(
                                  children: [
                                    // Image(
                                    //   image: AssetImage("assets/doctor-visit.png"),
                                    //   width:
                                    //       24.0, // Adjust the width of the image as needed
                                    //   height:
                                    //       24.0, // Adjust the height of the image as needed
                                    //   // You can also set other properties like fit, alignment, etc.
                                    // ),
                                    Text(
                                      'Examination',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(40.0),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Examination(
                                            doctorId: widget.doctorId,
                                            patientId: widget.patientId)),
                                  );
                                },
                              ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          Expanded(
                              child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.deepPurple.shade300,
                                      Colors.deepPurple.shade800
                                    ]),
                              ),
                              width: 140.0,
                              height: 140.0,
                              child: ListTile(
                                title: const Column(
                                  children: [
                                    // Image(
                                    //   image:
                                    //       AssetImage("assets/lab-technician.png"),
                                    //   width:
                                    //       24.0, // Adjust the width of the image as needed
                                    //   height:
                                    //       24.0, // Adjust the height of the image as needed
                                    //   // You can also set other properties like fit, alignment, etc.
                                    // ),
                                    Text(
                                      'Lab Tests',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'MyCustomFont',
                                        fontSize: 28.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(40.0),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => LabTest(
                                            doctorId: widget.doctorId,
                                            patientId: widget.patientId)),
                                  );
                                },
                              ),
                            ),
                          )),
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.deepPurple.shade300,
                                      Colors.deepPurple.shade800
                                    ]
                                    //colors: [Color(0xFFB39DDB), Color(0xFFD1C4E9)]
                                    ),
                              ),
                              width: 140.0,
                              height: 140.0,
                              child: ListTile(
                                title: const Column(
                                  children: [
                                    // Image(
                                    //   image: AssetImage("assets/medical-scan.png"),
                                    //   width:
                                    //       24.0, // Adjust the width of the image as needed
                                    //   height:
                                    //       24.0, // Adjust the height of the image as needed
                                    //   // You can also set other properties like fit, alignment, etc.
                                    // ),
                                    Text(
                                      'Radiology Reports',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'MyCustomFont',
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(40.0),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => RadiologyReport(
                                            doctorId: widget.doctorId,
                                            patientId: widget.patientId)),
                                  );
                                },
                              ),
                            ),
                          )),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          Expanded(
                              child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.deepPurple.shade300,
                                      Colors.deepPurple.shade800
                                    ]),
                              ),
                              width: 140.0,
                              height: 140.0,
                              child: ListTile(
                                title: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Image(
                                    //   image: AssetImage("assets/prescription.png"),
                                    //   width:
                                    //       24.0, // Adjust the width of the image as needed
                                    //   height:
                                    //       24.0, // Adjust the height of the image as needed
                                    //   // You can also set other properties like fit, alignment, etc.
                                    // ),
                                    Text(
                                      'Prescription',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'MyCustomFont',
                                        fontSize: 27.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(40.0),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Prescription(
                                            doctorId: widget.doctorId,
                                            patientId: widget.patientId)),
                                  );
                                },
                              ),
                            ),
                          )),
                          const SizedBox(width: 15.0),
                          Expanded(
                              child: Card(
                            color: Colors.transparent,
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.deepPurple.shade300,
                                      Colors.deepPurple.shade800
                                    ]
                                    //colors: [Color(0xFFB39DDB), Color(0xFFD1C4E9)]
                                    ),
                              ),
                              width: 140.0,
                              height: 140.0,
                              child: ListTile(
                                title: const Column(
                                  children: [
                                    // Image(
                                    //   image: AssetImage("assets/notes.png"),
                                    //   width:
                                    //       24.0, // Adjust the width of the image as needed
                                    //   height:
                                    //       24.0, // Adjust the height of the image as needed
                                    //   // You can also set other properties like fit, alignment, etc.
                                    // ),
                                    Text(
                                      'Other Notes',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'MyCustomFont',
                                        fontSize: 27.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.normal,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                contentPadding: EdgeInsets.all(40.0),
                                //contentPadding: EdgeInsets.all(40.0),

                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => Notes(
                                            doctorId: widget.doctorId,
                                            patientId: widget.patientId)),
                                  );
                                },
                              ),
                            ),
                          )),
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
