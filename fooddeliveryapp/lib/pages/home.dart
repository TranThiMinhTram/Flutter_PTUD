import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/details.dart';
import 'package:fooddeliveryapp/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, salad = false, burger = false, pizza = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "hello lyly",
                  style: AppWiget.boldTextFeildStyle(),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20.0),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      color: Colors.black,
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
            Text(
              "Delicious Food",
              style: AppWiget.HeadlineTextFeildStyle(),
            ),
            Text(
              "Discover and Get Great Food",
              style: AppWiget.LightTextFeildStyle(),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(margin: const EdgeInsets.only(right: 20.0), child: showItem()),
            const SizedBox(
              height: 30.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Details()));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.all(14),
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
                                "Veggie Taco Hash",
                                style: AppWiget.SemiBoldTextFeildStyle(),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "Fresh and Healthy",
                                style: AppWiget.LightTextFeildStyle(),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "\$25",
                                style: AppWiget.SemiBoldTextFeildStyle(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(14),
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
                              "Veggie Taco Hash",
                              style: AppWiget.SemiBoldTextFeildStyle(),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Fresh and Healthy",
                              style: AppWiget.LightTextFeildStyle(),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "\$25",
                              style: AppWiget.SemiBoldTextFeildStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(14),
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
                              "Veggie Taco Hash",
                              style: AppWiget.SemiBoldTextFeildStyle(),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "Fresh and Healthy",
                              style: AppWiget.LightTextFeildStyle(),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "\$25",
                              style: AppWiget.SemiBoldTextFeildStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 30.0,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
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
                              height: 120.0,
                              width: 120.0,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "Mediterramean Chickpea Salad",
                                      style: AppWiget.SemiBoldTextFeildStyle(),
                                    )),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "Honey goot cheese",
                                      style: AppWiget.LightTextFeildStyle(),
                                    )),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "&28",
                                      style: AppWiget.SemiBoldTextFeildStyle(),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
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
                              height: 120.0,
                              width: 120.0,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "Mediterramean Chickpea Salad",
                                      style: AppWiget.SemiBoldTextFeildStyle(),
                                    )),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "Honey goot cheese",
                                      style: AppWiget.LightTextFeildStyle(),
                                    )),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      "&28",
                                      style: AppWiget.SemiBoldTextFeildStyle(),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget showItem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            icecream = true;
            salad = false;
            burger = false;
            pizza = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: icecream ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/ice-cream.png",
                height: 40.0,
                width: 40.0,
                fit: BoxFit.cover,
                color: icecream ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            salad = false;
            burger = false;
            pizza = true;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: pizza ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/pizza.png",
                height: 40.0,
                width: 40.0,
                fit: BoxFit.cover,
                color: pizza ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            salad = true;
            burger = false;
            pizza = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: salad ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/salad.png",
                height: 40.0,
                width: 40.0,
                fit: BoxFit.cover,
                color: salad ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            icecream = false;
            salad = false;
            burger = true;
            pizza = false;
            setState(() {});
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                  color: burger ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                "images/burger.png",
                height: 40.0,
                width: 40.0,
                fit: BoxFit.cover,
                color: burger ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
