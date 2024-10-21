import 'package:flutter/material.dart';
import 'package:quiz/Service/addquestion.dart';
import 'package:quiz/widget/button/bluebutton.dart';
import 'package:quiz/widget/dropdownbutton.dart';

class AdmitScreen extends StatefulWidget {
  const AdmitScreen({super.key});

  @override
  State<AdmitScreen> createState() => _AdmitScreenState();
}

class _AdmitScreenState extends State<AdmitScreen> {
  final _formkey = GlobalKey<FormState>();
  bool isadmin = false;
  String? dropdownvalue = 'java';
  List<String> value = ['java', 'c++', 'python', 'dart'];

  String? quation;
  String? Correctanswer;
  String? boption;
  String? coption;
  String? doptioin;

  @override
  void initState() {
    super.initState();
  }

  final admintextcontroller = TextEditingController();
  final valuecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            const Text(
              "Add New Quation",
              style: TextStyle(
                  color: Color.fromARGB(255, 11, 15, 252),
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formkey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(85, 126, 126, 126),
                                blurRadius: 5,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(2, 5),
                                spreadRadius: 3)
                          ]),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) return "Enter Quation";
                        },
                        onSaved: (newValue) {
                          setState(() {
                            quation = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Quation"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          "Answer Options",
                          style: TextStyle(
                            color: const Color.fromARGB(
                              255,
                              7,
                              51,
                              247,
                            ),
                          ),
                        ),
                        Spacer(),
                        dropdownbutton(
                          value: value,
                          ondropvalue: (value) {
                            dropdownvalue = value;
                          },
                        ),
                        // IconButton(
                        //     onPressed: () {
                        //       _addshowDialog(context);
                        //     },
                        //     icon: Icon(Icons.add_rounded))
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 238, 250, 239),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(85, 126, 126, 126),
                                blurRadius: 5,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(2, 5),
                                spreadRadius: 3)
                          ]),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Correct Option";
                          }
                        },
                        onSaved: (newValue) {
                          setState(() {
                            Correctanswer = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Correct Option"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 250, 238, 238),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(85, 126, 126, 126),
                                blurRadius: 5,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(2, 5),
                                spreadRadius: 3)
                          ]),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) return "Enter Answer Option";
                        },
                        onSaved: (newValue) {
                          setState(() {
                            boption = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "B option"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 250, 238, 238),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(85, 126, 126, 126),
                                blurRadius: 5,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(2, 5),
                                spreadRadius: 3)
                          ]),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) return "Enter Answer Option";
                        },
                        onSaved: (newValue) {
                          setState(() {
                            coption = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "C option"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(255, 250, 238, 238),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(85, 126, 126, 126),
                                blurRadius: 5,
                                blurStyle: BlurStyle.normal,
                                offset: Offset(2, 5),
                                spreadRadius: 3)
                          ]),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) return "Enter Answer Option";
                        },
                        onSaved: (newValue) {
                          setState(() {
                            doptioin = newValue!;
                          });
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "D Option"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Bluebutton(
                        onpress: () {
                          onpress();
                        },
                        btntext: "Add new question")
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  void _showDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: Text("Security key 😉"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: admintextcontroller,
                decoration: const InputDecoration(hintText: "enter Admin key"),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (admintextcontroller.text.isNotEmpty &&
                    admintextcontroller.text.contains("marmiju")) {
                  Addquestion.addquestion(dropdownvalue as String, quation,
                      Correctanswer, boption, coption, doptioin);

                  Navigator.pop(context);
                  _formkey.currentState!.reset();
                }
              },
              child: const Text("submit"),
            ),
          ],
        );
      },
    );
  }

  void _addshowDialog(
    BuildContext context,
  ) {
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: const Text("others -temporary"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: valuecontroller,
                decoration: const InputDecoration(hintText: "add new"),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (valuecontroller.text.isEmpty &&
                    value.contains(valuecontroller.text)) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Value Is already Added"),
                    ),
                  );
                  Navigator.pop(context);
                  return;
                }
                setState(() {
                  value.add(valuecontroller.text);
                });
                Navigator.pop(context);
              },
              child: const Text("add"),
            ),
          ],
        );
      },
    );
  }

  void onpress() {
    final _isvalided = _formkey.currentState!.validate();
    if (!_isvalided) {
      return;
    }
    _formkey.currentState!.save();
    _showDialog(context);
  }
}
