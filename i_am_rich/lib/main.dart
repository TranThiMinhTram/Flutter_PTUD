import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white, //grey.shade300
        appBar: AppBar(
          title: const Text("I Am Rich"),
          backgroundColor: Colors.orange,
          centerTitle: true,
          //leading: Icon(Icons.arrow_back_ios),
        ),
        body: const Center(
          // child: SizedBox(
          //     width: 5000, // Kích thước chiều rộng bạn muốn
          //     height: 5000, // Kích thước chiều cao bạn muốn
          child: Image(
            image: AssetImage("images/rich.jpg"),
            width: 1000,
            height: 1000,
            //   ),
          ),
        ),
      ),
    ),
  );
}
