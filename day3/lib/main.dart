/* Day 3 - Landing Page

Design Hint...

What's the main focus? Is it for a book, an album, a mobile app, a product?
Consider important landing page elements (call-to-actions, clarity, etc.)

 */

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                "Flutter",
                style: GoogleFonts.rockSalt(
                  color: Colors.cyanAccent,
                  fontSize: 90,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: CallToActionButton(),
          ),
          SliverToBoxAdapter(
            child: Footer(),
          ),
        ],
      ),
    );
  }
}

class CallToActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: MaterialButton(
        height: 50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        hoverElevation: 0.0,
        color: Colors.cyanAccent,
        onPressed: () => launch("https://flutter.dev/"),
        child: Text(
          "go to Flutter website",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Spacer(),
                  FlatButton(
                    shape: CircleBorder(),
                    hoverColor: Colors.white.withOpacity(0.2),
                    color: Colors.transparent,
                    onPressed: () => launch("https://dribbble.com/ta93abe"),
                    child: Icon(
                      FontAwesome.dribbble,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  FlatButton(
                    shape: CircleBorder(),
                    hoverColor: Colors.white.withOpacity(0.2),
                    color: Colors.transparent,
                    onPressed: () => launch("https://github.com/ta93abe"),
                    child: Icon(
                      FontAwesome.github,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "© ta93abe in 2020",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "made with Flutter",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    FlutterLogo(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
