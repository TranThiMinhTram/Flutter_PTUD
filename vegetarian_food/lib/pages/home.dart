import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vegetarian_food/pages/details.dart';
import 'package:vegetarian_food/service/database.dart';
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

  Stream? fooditemStream;

  ontheload() async {
    fooditemStream = await DatabaseMethods().getFoodItem("salad");
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  Widget allItemsVertically() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      detail: ds["Details"],
                                      name: ds["Name"],
                                      price: ds["Price"],
                                      image: ds["Image"],
                                    )));
                      },
                      child: Container(
                        margin:
                            const EdgeInsets.only(right: 20.0, bottom: 20.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 120,
                                    width: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(
                                          ds["Name"],
                                          style: AppWidget
                                              .semiBooldTextFeildStyle(),
                                        )),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(
                                          "Honey good cheese",
                                          style:
                                              AppWidget.LightTextFeildStyle(),
                                        )),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(
                                          "\$" + ds["Price"],
                                          style: AppWidget
                                              .semiBooldTextFeildStyle(),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  Widget allItems() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Details(
                                      detail: ds["Details"],
                                      name: ds["Name"],
                                      price: ds["Price"],
                                      image: ds["Image"],
                                    )));
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
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      ds["Image"],
                                      height: 150.0,
                                      width: 150.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    ds["Name"],
                                    style: AppWidget.semiBooldTextFeildStyle(),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "Spicy with Onion",
                                    style: AppWidget.LightTextFeildStyle(),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "\$" + ds["Price"],
                                    style: AppWidget.semiBooldTextFeildStyle(),
                                  )
                                ]),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

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
              SizedBox(
                height: 20.0,
              ),
              Text("Delicious Food", style: AppWidget.HeadlineTextFeildStyle()),
              Text("Discover and Get Great Food",
                  style: AppWidget.LightTextFeildStyle()),
              SizedBox(
                height: 20.0,
              ),
              Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  child: showItem()),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(height: 270, child: allItems()),
              SizedBox(
                height: 30.0,
              ),
              allItemsVertically(),
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
          //pizza
          GestureDetector(
              onTap: () async {
                pizza = true;
                salad = false;
                burger = false;
                rice_roll = false;
                noodle = false;
                bread = false;
                dumpling = false;
                soup = false;
                porridge = false;

                fooditemStream = await DatabaseMethods().getFoodItem("pizza");
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

          //salad
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () async {
                pizza = false;
                salad = true;
                burger = false;
                rice_roll = false;
                noodle = false;
                bread = false;
                dumpling = false;
                soup = false;
                porridge = false;

                fooditemStream = await DatabaseMethods().getFoodItem("salad");
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

          //burger
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () async {
                pizza = false;
                salad = false;
                burger = true;
                rice_roll = false;
                noodle = false;
                bread = false;
                dumpling = false;
                soup = false;
                porridge = false;

                fooditemStream = await DatabaseMethods().getFoodItem("burger");
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

          //rice_roll
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () async {
                pizza = false;
                salad = false;
                burger = false;
                rice_roll = true;
                noodle = false;
                bread = false;
                dumpling = false;
                soup = false;
                porridge = false;
                fooditemStream =
                    await DatabaseMethods().getFoodItem("rice_roll");
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

          //noodle
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () async {
                pizza = false;
                salad = false;
                burger = false;
                rice_roll = false;
                noodle = true;
                bread = false;
                dumpling = false;
                soup = false;
                porridge = false;
                fooditemStream = await DatabaseMethods().getFoodItem("noodle");
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

          //bread
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () async {
                pizza = false;
                salad = false;
                burger = false;
                rice_roll = false;
                noodle = false;
                bread = true;
                dumpling = false;
                soup = false;
                porridge = false;
                fooditemStream = await DatabaseMethods().getFoodItem("bread");
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

          //dumpling
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () async {
                pizza = false;
                salad = false;
                burger = false;
                rice_roll = false;
                noodle = false;
                bread = false;
                dumpling = true;
                soup = false;
                porridge = false;
                fooditemStream =
                    await DatabaseMethods().getFoodItem("dumpling");
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

          //soup
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () async {
                pizza = false;
                salad = false;
                burger = false;
                rice_roll = false;
                noodle = false;
                bread = false;
                dumpling = false;
                soup = true;
                porridge = false;
                fooditemStream = await DatabaseMethods().getFoodItem("soup");
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

          // porridge
          const SizedBox(width: 20),
          GestureDetector(
              onTap: () async {
                pizza = false;
                salad = false;
                burger = false;
                rice_roll = false;
                noodle = false;
                bread = false;
                dumpling = false;
                soup = false;
                porridge = true;
                fooditemStream =
                    await DatabaseMethods().getFoodItem("porridge");
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
