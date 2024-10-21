import 'package:flutter/material.dart';
import 'package:quiz/Service/getinfo.dart';
import 'package:quiz/widget/Userinfo.dart';
import 'package:quiz/widget/button/bluebutton.dart';
import 'package:quiz/widget/dropdownbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/widget/single_question.dart'; // Firestore import

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String? dropdownvalue;
  List<String> value = ['java', 'c++', 'python', 'dart'];

  @override
  void initState() {
    getquestion('java');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                ),
                color: Color.fromARGB(255, 4, 0, 255),
              ),
              child: StreamBuilder(
                stream: getUSerinfo(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.hasError) {
                    return Text(
                      "Something else : ${snapshot.error}",
                      style: const TextStyle(color: Colors.white),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final userdata = snapshot.data!.data() as Map;
                  return Userinfo(
                    image: userdata['propic'],
                    name: userdata['name'],
                  ); // Return the widget for displaying user info
                },
              ),
            ),

            /// Userinfo Section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Select One Type to test you",
                        style: TextStyle(
                            color: const Color.fromARGB(
                              255,
                              7,
                              51,
                              247,
                            ),
                            fontSize: MediaQuery.of(context).size.width * 0.04),
                      ),
                      const SizedBox(width: 50),
                      dropdownbutton(
                        value: value,
                        ondropvalue: (value) {
                          setState(() {
                            dropdownvalue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Make the ListView scrollable within the remaining space
            dropdownvalue != null
                ? Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: getquestion(dropdownvalue!),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return const Text("Error loading data");
                          } else if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return const Text("No questions available");
                          } else {
                            // Extracting the data from the QuerySnapshot
                            var questions =
                                snapshot.data!.docs; // List of documents
                            return sinnglequestion(
                              question: questions,
                              dropdownvalue: dropdownvalue!,
                            );
                          }
                        }),
                  )
                : const Center(
                    child: Text("Please select a category"),
                  ), // Message for null dropdownvalue
          ],
        ),
      ),
    );
  }
}
