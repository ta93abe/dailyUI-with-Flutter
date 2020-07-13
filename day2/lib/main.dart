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
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Text('Hello World'),
      ),
    );
  }
}
