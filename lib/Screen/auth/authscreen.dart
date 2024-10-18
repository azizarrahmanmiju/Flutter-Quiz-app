import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quiz/Service/authservice.dart';
import 'package:quiz/widget/Imagepicker.dart';
import 'package:quiz/widget/button/bluebutton.dart';
import 'package:quiz/widget/titletext.dart';

class Authscreen extends StatefulWidget {
  const Authscreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _auth();
  }
}

class _auth extends State<Authscreen> {
  final formkey = GlobalKey<FormState>();

  static bool islogin = true;

  File? _selectedimage;
  String? enteredusername;
  String? enteredemail;
  String? enteredpassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Titletext(
                  title: islogin ? "LOG IN" : "SIGN UP",
                  subtitle: islogin
                      ? "Login and gain expreince you service"
                      : "create a new account to explore our service.",
                ),
                if (!islogin)
                  const SizedBox(
                    height: 20,
                  ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formkey,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Column(
                      children: [
                        if (!islogin)
                          PickImage(onpickimage: (image) {
                            _selectedimage = image;
                          }),
                        const SizedBox(
                          height: 20,
                        ),
                        if (islogin == false)
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Enter a Username";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              setState(() {
                                enteredusername = newValue;
                              });
                            },
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              hintText: "Enter Username",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 0, 47, 255),
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 0, 47, 255),
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 47, 255),
                                    width: 2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            //=
                            keyboardType: TextInputType.text,
                          ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            if (value == null || !value.contains("@")) {
                              return "Please Enter Valid email";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            setState(() {
                              enteredemail = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email),
                            hintText: "Enter email addres",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 47, 255),
                                width: 2,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 47, 255),
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 0, 47, 255),
                                  width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ), //=
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.length < 6) {
                              return "Please enter pass min 6 character";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            setState(() {
                              enteredpassword = newValue;
                            });
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.password_rounded),
                            hintText: "Enter Password",
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 47, 255),
                                width: 2,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 0, 47, 255),
                                width: 2,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 0, 47, 255),
                                  width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ), //=
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        Bluebutton(
                          onpress: () {
                            onpressed();
                          },
                          btntext: islogin ? "LOG IN" : "SIGN UP",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              islogin = !islogin;
                            });
                          },
                          child: Text(islogin
                              ? "create an account"
                              : "I have already an account"),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void onpressed() {
    final _isvalided = formkey.currentState!.validate();
    if (!_isvalided) {
      return;
    } else if (_selectedimage == null && !islogin) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Color.fromARGB(255, 13, 45, 223),
          content: Text("Please Select an Image"),
        ),
      );
      return;
    }
    formkey.currentState!.save();

    if (!islogin) {
      Authservice.accountcreation(context, enteredemail!, enteredusername!,
          enteredpassword!, _selectedimage!);
    } else {
      Authservice.loginservice(context, enteredemail!, enteredpassword!);
    }
  }
}
