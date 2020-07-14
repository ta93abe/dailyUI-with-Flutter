/* Day 4 - Calculator

Design Hint...

Design a calculator. Standard, scientific, or specialty calculator for something such as a mortgage?
Is it for a phone, a tablet, a web app?

 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
