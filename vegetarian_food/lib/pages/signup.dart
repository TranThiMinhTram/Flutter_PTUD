import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:vegetarian_food/pages/bottomnav.dart';
import 'package:vegetarian_food/pages/login.dart';

import '../widget/widget_support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  TextEditingController mailcontroller = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar((SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Register Successfully",
            style: TextStyle(fontSize: 21),
          ),
        )));

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Your Password is too weak!",
              style: TextStyle(fontSize: 21),
            ),
          )));
        } else if (e.code == "email-aldready-in-use") {
          ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Account Already exists",
              style: TextStyle(fontSize: 21),
            ),
          )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Color(0xff4caf50),
                        Color(0xff4caf50),
                      ])),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 2),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Text(""),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      Center(
                          child: Image.asset(
                        "images/logo.png",
                        width: MediaQuery.of(context).size.width / 1.75,
                        fit: BoxFit.cover,
                      )),

                      // SizedBox(height: 50.0,),

                      GestureDetector(
                        onTap: () async {
                          if (_formkey.currentState!.validate()) {
                            setState(() {
                              email = mailcontroller.text;
                              name = namecontroller.text;
                              password = passwordcontroller.text;
                            });
                          }
                          registration();
                        },
                        child: Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 1.75,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Text(
                                    "SIGN UP",
                                    style: AppWidget.HeadlineTextFeildStyle(),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextFormField(
                                    controller: namecontroller,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Your Username';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Username',
                                        hintStyle:
                                            AppWidget.semiBooldTextFeildStyle(),
                                        suffixIcon:
                                            Icon(Icons.person_outlined)),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextFormField(
                                    controller: mailcontroller,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Your Email';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Email',
                                        hintStyle:
                                            AppWidget.semiBooldTextFeildStyle(),
                                        suffixIcon: Icon(Icons.email_outlined)),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  TextFormField(
                                    controller: passwordcontroller,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Your Password';
                                      }
                                      return null;
                                    },

                                    obscureText: true, // ẩn pass
                                    decoration: InputDecoration(
                                        hintText: 'Password',
                                        hintStyle:
                                            AppWidget.semiBooldTextFeildStyle(),
                                        suffixIcon: Icon(Icons.lock_outline)),
                                  ),
                                  SizedBox(
                                    height: 30.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      if (_formkey.currentState!.validate()) {
                                        setState(() {
                                          email = mailcontroller.text;
                                          name = namecontroller.text;
                                          password = passwordcontroller.text;
                                        });
                                      }
                                      registration();
                                    },
                                    child: Material(
                                      elevation: 5.0,
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        width: 200,
                                        decoration: BoxDecoration(
                                            color: Color(0xff4caf50),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                            child: Text(
                                          "SIGN UP",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Login()));
                                      },
                                      child: Text(
                                        "Already have an account? Login",
                                        style:
                                            AppWidget.semiBooldTextFeildStyle(),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
