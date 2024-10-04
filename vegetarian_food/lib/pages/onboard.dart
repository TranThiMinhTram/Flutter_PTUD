import 'package:flutter/material.dart';
import 'package:vegetarian_food/pages/signup.dart';
import 'package:vegetarian_food/widget/content_model.dart';
import 'package:vegetarian_food/widget/widget_support.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIdex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIdex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 70.0, right: 20),
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: 310,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          contents[i].title,
                          style: AppWidget.semiBooldTextFeildStyle(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          contents[i].description,
                          style: AppWidget.LightTextFeildStyle(),
                        )
                      ],
                    ),
                  );
                }),
          ),
          // Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: List.generate(
          //       contents.length,
          //       (index) => buildDot(index, context),
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () {
              if (currentIdex == contents.length - 1) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const SignUp()));
              }

              _controller.nextPage(
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.bounceIn);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xff4caf50),
                  borderRadius: BorderRadius.circular(10)),
              height: 60,
              margin: const EdgeInsets.only(right: 20, left: 20, bottom: 70),
              width: double.infinity,
              child: Center(
                child: Text(
                  currentIdex == contents.length - 1 ? "Start" : "Next",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // Container buildDot(int index, BuildContext context) {
  //   return Container(
  //     height: 20.0,
  //     width: currentIdex == index ? 18 : 7,
  //     margin: const EdgeInsets.only(right: 5),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(6),
  //       color: Colors.black38,
  //     ),
  //   );
  // }
}
