import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController userpasswordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFededeb),
      body: Container(
        child: Stack(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
              padding: const EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Color.fromARGB(255, 177, 25, 25), Colors.black],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.elliptical(
                          MediaQuery.of(context).size.width, 110.0))),
            ),
            Container(
              margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 60.0),
              child: Form(
                  child: Column(
                children: [
                  const Text(
                    "Welcome Admin",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 5.0, bottom: 5.0),
                            margin: const EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 160, 160, 147)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: usernamecontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Username';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Username",
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 160, 160, 147))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 20.0, top: 5.0, bottom: 5.0),
                            margin: const EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 160, 160, 147)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: TextFormField(
                                controller: userpasswordcontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Password';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 160, 160, 147))),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            margin: const EdgeInsets.symmetric(horizontal: 20.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }

  LoginAdmin() {
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      for (var result in snapshot.docs) {
        if (result.data()['id'] != usernamecontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            "Your id is not correct",
            style: TextStyle(fontSize: 18.0),
          )));
        } else if (result.data()['password'] !=
            usernamecontroller.text.trim()) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            "Your password is not correct",
            style: TextStyle(fontSize: 18.0),
          )));
        } else {
          // Route route= MaterialPageRoute(builder: (context)=>Home)// đang làm tới đây
        }
      }
    });
  }
}
