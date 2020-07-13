/* Day 2 - Credit Card Checkout
Design a credit card checkout form or page.
Don't forget the important elements such as the numbers, dates, security numbers, etc.
 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credit Card Checkout',
      debugShowCheckedModeBanner: false,
      home: CreditCardCheckout(),
    );
  }
}

class CreditCardCheckout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(
            flex: 1,
          ),
          Text(
            "15 USD",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: AspectRatio(
              aspectRatio: 1.41421356 / 1,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.transparent),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(1, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Spacer(),
                    TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "XXXX XXXX XXXX XXXX",
                        prefix: Text("card no."),
                      ),
                    ),
                    Spacer(),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration:
                          InputDecoration(hintText: "XXX", suffixText: "cvc"),
                    ),
                    Spacer(),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "XX/XX",
                        prefix: Text("exp"),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          FlatButton(
            color: Colors.greenAccent,
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "checkout",
                ),
                Icon(
                  Icons.check,
                ),
              ],
            ),
          ),
          Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
