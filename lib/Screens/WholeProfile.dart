// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class WholeProfile extends StatelessWidget {
//   final String doctorId;
//   final String patientId;

//   WholeProfile({required this.doctorId, required this.patientId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Whole Profile"),
//         backgroundColor: Color(0xFF4749a0),
//         foregroundColor: Colors.white,
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('doctors')
//             .doc(doctorId)
//             .collection('patients')
//             .doc(patientId)
//             .collection('patient_history')
//             .snapshots(),
//         builder: (context, snapshot) {
//           debugPrint("$doctorId $patientId");
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           final historyDataa = snapshot.data!.docs;
//           final List<Widget> mywidgets = [];
//           for (var element in historyDataa) {
//             if (element.id == "Lab-test") {
//               mywidgets.add(Text(element["tests"]));
//             }
//             if (element.id == "Other_Notes") {
//               mywidgets.add(Text(element["notes"]));
//             }
//             if (element.id == "Prescriptions") {
//               mywidgets.add(Text(element["prescription"]));
//             }
//             if (element.id == "examination") {
//               mywidgets.add(Text(element["examine"]));
//             }
//             if (element.id == "radio-reports") {
//               mywidgets.add(Text(element["reports"]));
//             }
//             if (element.id == "Peads" ||
//                 element.id == "Gynea" ||
//                 element.id == "medicines" ||
//                 element.id == "Surgery") {
//               mywidgets.add(Text(element["fh"]));
//               mywidgets.add(Text(element["hopc"]));
//               mywidgets.add(Text(element["pasth"]));
//               mywidgets.add(Text(element["pc"]));
//               mywidgets.add(Text(element["perh"]));
//               mywidgets.add(Text(element["sh"]));
//               mywidgets.add(Text(element["si"]));
//               mywidgets.add(Text(element["vh"]));
//             }
//           }
//           return Column(children: mywidgets);

//           /* if (historyDataa.isNotEmpty) {
//             Map<String, dynamic>? historyData =
//                 historyDataa.first.data() as Map<String, dynamic>?;

//             return ListView(
//               children: [
//                 buildHistoryComponent(
//                     context, historyData?['Lab-test'], 'Lab Test'),
//                 buildHistoryComponent(
//                     context, historyData?['Other_Notes'], 'Other Notes'),
//                 buildHistoryComponent(
//                     context,
//                     historyData?['Peads/Gynea/Medicines/Surgery'],
//                     'Peads/Gynea/Medicines/Surgery'),
//                 buildHistoryComponent(
//                     context, historyData?['Prescriptions'], 'Prescriptions'),
//                 buildHistoryComponent(
//                     context, historyData?['examination'], 'Examinations'),
//                 buildHistoryComponent(
//                     context, historyData?['radio-reports'], 'Radio Reports'),
//               ],
//             );
//           } else {
//             return Center(child: Text('No data available'));
//           }*/
//         },
//       ),
//     );
//   }

//   Widget buildHistoryComponent(
//     BuildContext context,
//     List<dynamic>? data,
//     String title,
//   ) {
//     return ListTile(
//       title: Text(title),
//       onTap: () {
//         if (data != null) {
//           print(data);
//         } else {
//           print("No data available for $title");
//         }
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WholeProfile extends StatelessWidget {
  final String doctorId;
  final String patientId;

  WholeProfile({required this.doctorId, required this.patientId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Whole Profile"),
        backgroundColor: Color(0xFF4749a0),
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('doctors')
            .doc(doctorId)
            .collection('patients')
            .doc(patientId)
            .collection('patient_history')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final historyDataa = snapshot.data!.docs;
          final List<Widget> mywidgets = [];

          // Consolidate the conditions for Peads/Gynea/Surgery and Medicines
          for (var element in historyDataa) {
            if (element.id == "Peads" ||
                element.id == "Gynea" ||
                element.id == "medicines" ||
                element.id == "Surgery") {
              mywidgets.add(buildSubSection(
                  element.id,
                  element.id == "Peads"
                      ? "Pediatrics"
                      : element.id == "Gynea"
                          ? "Gynecology"
                          : element.id == "medicines"
                              ? "Medicines"
                              : "Surgery",
                  element.data() as Map<String, dynamic>));
            } else {
              // For other history components
              mywidgets.add(buildHistoryComponent(
                  element.id, element.data() as Map<String, dynamic>));
            }
          }

          return SingleChildScrollView(
            child: Column(children: mywidgets),
          );
        },
      ),
    );
  }

  Widget buildHistoryComponent(String title, Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        surfaceTintColor: Color(0xFFD1C4E9),
        child: ListTile(
          title: Text(title),
          subtitle: Text(data.toString().replaceAll(RegExp(r'{|}'), '')),
          onTap: () {
            print(data);
          },
        ),
      ),
    );
  }

  Widget buildSubSection(
      String title, String fullTitle, Map<String, dynamic> data) {
    final List<String> fieldNames = [
      'Presenting Complaint',
      'History Of Presenting Complaint(HOPC)',
      'Systemic Inquiry',
      'Past History',
      'Family History',
      'Personal History',
      'Socioeconomical History',
      'Vaccination History',
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        surfaceTintColor: Color(0xFFD1C4E9),
        child: Column(
          children: [
            ListTile(
              title: Text(fullTitle),
            ),
            Divider(),
            ...fieldNames.map((fieldName) {
              return ListTile(
                title: Text(fieldName),
                subtitle: Text(data[fieldName] ?? "No data available"),
                onTap: () {
                  if (data[fieldName] != null) {
                    print(data[fieldName]);
                  } else {
                    print("No data available for $fieldName");
                  }
                },
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
