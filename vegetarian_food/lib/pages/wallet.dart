import 'package:flutter/material.dart';
import 'package:vegetarian_food/widget/widget_support.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Center(
                    child: Text(
                  "Wallet",
                  style: AppWidget.HeadlineTextFeildStyle(),
                )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.grey),
              child: Row(
                children: [
                  Image.asset(
                    "images/wallet.png",
                    width: 60,
                    height: 60,
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Wallet",
                        style: AppWidget.LightTextFeildStyle(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "50000",
                        style: AppWidget.boldTextFeildStyle(),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Text(
                "Add money",
                style: AppWidget.semiBooldTextFeildStyle(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "50000",
                    style: AppWidget.semiBooldTextFeildStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "100000",
                    style: AppWidget.semiBooldTextFeildStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "200000",
                    style: AppWidget.semiBooldTextFeildStyle(),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "500000",
                    style: AppWidget.semiBooldTextFeildStyle(),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 12),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  "Add Money",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
