import 'package:final_project/templates/gynea.dart';
import 'package:final_project/templates/medicines.dart';
import 'package:final_project/templates/peads.dart';
import 'package:final_project/templates/surgery.dart';
import 'package:flutter/material.dart';

class Templates extends StatefulWidget {
  final String patientId;
  final String doctorId;
  Templates({required this.patientId, required this.doctorId});
  @override
  State<Templates> createState() => Templates_State();
}

class Templates_State extends State<Templates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Templates'),
        backgroundColor: Color(0xFF311B92),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.white]
              //colors: [Colors.brown.shade200, Colors.brown.shade200]),
              ),
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
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
                            title: Text(
                              'Surgery',
                              style: TextStyle(
                                color: Colors.white,
                                // fontFamily: 'MyCustomFont',
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            contentPadding: EdgeInsets.all(40.0),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Surgery_temp(
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
                            title: Text(
                              'Medicine',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            contentPadding: EdgeInsets.all(40.0),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => medicine_temp(
                                    patientId: widget.patientId,
                                    doctorId: widget.doctorId,
                                  ),
                                ),
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
                            title: Text(
                              'Peads',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'MyCustomFont',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            contentPadding: EdgeInsets.all(40.0),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => peads_temp(
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
                            title: Text(
                              'Gynecology',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'MyCustomFont',
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.normal,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            contentPadding: EdgeInsets.all(40.0),
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Gynea_temp(
                                    patientId: widget.patientId,
                                    doctorId: widget.doctorId,
                                  ),
                                ),
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
    );
  }
}
