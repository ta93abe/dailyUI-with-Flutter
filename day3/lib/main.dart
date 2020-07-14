/* Day 3 - Landing Page

Design Hint...

What's the main focus? Is it for a book, an album, a mobile app, a product?
Consider important landing page elements (call-to-actions, clarity, etc.)

 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Landing Page',
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
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
