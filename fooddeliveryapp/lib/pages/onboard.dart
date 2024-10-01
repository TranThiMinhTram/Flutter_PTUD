import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/signup.dart';
import 'package:fooddeliveryapp/widget/content_model.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late final PageController _controller; // Declare the controller

  @override
  void initState() {
    super.initState();
    _controller = PageController(); // Initialize the controller
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller to avoid memory leaks
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
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40),
                    child: Column(
                      children: [
                        Image.asset(
                          contents[i].image,
                          height: 400,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          contents[i].title,
                          style: AppWiget.HeadlineTextFeildStyle(),
                        ),
                        Center(
                          child: Text(
                            contents[i].description,
                            style: AppWiget.LightTextFeildStyle(),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => builbDot(index, context),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == contents.length - 1) {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => const SignUp()));
              }
              _controller.nextPage(
                  duration: const Duration(microseconds: 100),
                  curve: Curves.bounceIn);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              height: 60,
              margin: const EdgeInsets.all(40),
              width: double.infinity,
              child: Center(
                child: Text(
                  currentIndex == contents.length - 1 ? "Start" : "Next",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container builbDot(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: currentIndex == index ? 18 : 7,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6), color: Colors.black38),
    );
  }
}
