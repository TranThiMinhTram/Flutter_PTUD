import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vegetarian_food/pages/details.dart';
import 'package:vegetarian_food/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool pizza = false,
      salad = false,
      burger = false,
      rice_roll = false,
      noodle = false,
      bread = false,
      dumpling = false,
      soup = false,
      porridge = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Bao toàn bộ nội dung để cho phép cuộn khi nội dung lớn hơn kích thước màn hình
        child: Container(
          margin: const EdgeInsets.only(top: 50.0, left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hello World", style: AppWidget.boldTextFeildStyle()),
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text("Delicious Food", style: AppWidget.HeadlineTextFeildStyle()),
              Text("Discover and Get Great Food",
                  style: AppWidget.LightTextFeildStyle()),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: showItem()),
              const SizedBox(
                height: 30.0,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Details()));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "images/salad2.png",
                                    height: 150.0,
                                    width: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    "Veggie Tace Hash",
                                    style: AppWidget.semiBooldTextFeildStyle(),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Spicy with Onion",
                                    style: AppWidget.LightTextFeildStyle(),
                                  ),
                                  Text(
                                    "\$25",
                                    style: AppWidget.semiBooldTextFeildStyle(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Container(
                        margin: const EdgeInsets.all(4),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "images/salad2.png",
                                    height: 150.0,
                                    width: 150.0,
                                    fit: BoxFit.cover,
                                  ),
                                  Text(
                                    "Mix Veg Salad",
                                    style: AppWidget.semiBooldTextFeildStyle(),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Fresh and Healthy",
                                    style: AppWidget.LightTextFeildStyle(),
                                  ),
                                  Text(
                                    "\$28",
                                    style: AppWidget.semiBooldTextFeildStyle(),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 30),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/salad2.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Mediterranean Chickpea Salad",
                                  style: AppWidget.semiBooldTextFeildStyle(),
                                )),
                            const SizedBox(
                              width: 5.0,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Honey good cheese",
                                  style: AppWidget.LightTextFeildStyle(),
                                )),
                            const SizedBox(
                              width: 5.0,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "\$28",
                                  style: AppWidget.semiBooldTextFeildStyle(),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/salad2.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "New Salad Item",
                                  style: AppWidget.semiBooldTextFeildStyle(),
                                )),
                            const SizedBox(
                              height: 5.0,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Fresh and Tasty",
                                  style: AppWidget.LightTextFeildStyle(),
                                )),
                            const SizedBox(
                              height: 5.0,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "\$30",
                                  style: AppWidget.semiBooldTextFeildStyle(),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "images/salad2.png",
                          height: 120,
                          width: 120,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "New Salad Item",
                                  style: AppWidget.semiBooldTextFeildStyle(),
                                )),
                            const SizedBox(
                              height: 5.0,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Fresh and Tasty",
                                  style: AppWidget.LightTextFeildStyle(),
                                )),
                            const SizedBox(
                              height: 5.0,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "\$30",
                                  style: AppWidget.semiBooldTextFeildStyle(),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Cuộn ngang
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                pizza = true;
                salad = false;
                burger = false;
                rice_roll = false;
                noodle = false;
                bread = false;
                dumpling = false;
                soup = false;
                porridge = false;
                setState(() {});
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: pizza ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    "images/pizza.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    color: pizza ? Colors.white : Colors.black,
                  ),
                ),
              )),
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () {
                pizza = false;
                salad = true;
                burger = false;
                rice_roll = false;
                noodle = false;
                bread = false;
                dumpling = false;
                soup = false;
                porridge = false;
                setState(() {});
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: salad ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    "images/salad.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    color: salad ? Colors.white : Colors.black,
                  ),
                ),
              )),
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () {
                pizza = false;
                salad = false;
                burger = true;
                rice_roll = false;
                noodle = false;
                bread = false;
                dumpling = false;
                soup = false;
                porridge = false;
                setState(() {});
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: burger ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    "images/burger.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    color: burger ? Colors.white : Colors.black,
                  ),
                ),
              )),
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () {
                pizza = false;
                salad = false;
                burger = false;
                rice_roll = true;
                noodle = false;
                bread = false;
                dumpling = false;
                soup = false;
                porridge = false;
                setState(() {});
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: rice_roll ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    "images/rice_roll.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    color: rice_roll ? Colors.white : Colors.black,
                  ),
                ),
              )),
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () {
                pizza = false;
                salad = false;
                burger = false;
                rice_roll = false;
                noodle = true;
                bread = false;
                dumpling = false;
                soup = false;
                porridge = false;
                setState(() {});
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: noodle ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    "images/noodle.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    color: noodle ? Colors.white : Colors.black,
                  ),
                ),
              )),
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () {
                pizza = false;
                salad = false;
                burger = false;
                rice_roll = false;
                noodle = false;
                bread = true;
                dumpling = false;
                soup = false;
                porridge = false;
                setState(() {});
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: bread ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    "images/bread.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    color: bread ? Colors.white : Colors.black,
                  ),
                ),
              )),
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () {
                pizza = false;
                salad = false;
                burger = false;
                rice_roll = false;
                noodle = false;
                bread = false;
                dumpling = true;
                soup = false;
                porridge = false;
                setState(() {});
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: dumpling ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    "images/dumpling.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    color: dumpling ? Colors.white : Colors.black,
                  ),
                ),
              )),
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () {
                pizza = false;
                salad = false;
                burger = false;
                rice_roll = false;
                noodle = false;
                bread = false;
                dumpling = false;
                soup = true;
                porridge = false;
                setState(() {});
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: soup ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    "images/soup.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    color: soup ? Colors.white : Colors.black,
                  ),
                ),
              )),
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () {
                pizza = false;
                salad = false;
                burger = false;
                rice_roll = false;
                noodle = false;
                bread = false;
                dumpling = false;
                soup = false;
                porridge = true;
                setState(() {});
              },
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                      color: porridge ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    "images/porridge.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                    color: porridge ? Colors.white : Colors.black,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
