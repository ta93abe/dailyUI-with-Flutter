/* Day 10 - Social Share

Design Hint...

Design a social share button/icon and be mindful of the size, imagery, placement, and purpose for sharing.

 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Share',
      home: SocialShare(),
    );
  }
}

class SocialShare extends StatelessWidget {
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
