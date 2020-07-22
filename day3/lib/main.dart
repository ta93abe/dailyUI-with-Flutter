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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "Flutter",
                style: GoogleFonts.rockSalt(
                  color: Colors.cyanAccent,
                  fontSize: 90,
                ),
              ),
            ),
            GridPhotos(),
            SizedBox(
              height: 100,
            ),
            CallToActionButton(),
            SizedBox(
              height: 40,
            ),
            Footer(),
          ],
        ),
      ),
    );
  }
}

class GridPhotos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 1000),
      child: GridView(
        padding: EdgeInsets.all(10),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1 / 1,
        ),
        children: [
          Container(
            child: Image.asset(
              "assets/dart.png",
              fit: BoxFit.fitWidth,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          Container(
            child: Image.asset(
              "assets/dart_h.png",
              fit: BoxFit.fitWidth,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          Container(
            child: Image.asset(
              "assets/dart_v.png",
              fit: BoxFit.fitHeight,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          Container(
            child: Image.asset(
              "assets/flutter.png",
              fit: BoxFit.fitHeight,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          Container(
            child: Image.asset(
              "assets/flutter_h.png",
              fit: BoxFit.fitWidth,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          Container(
            child: Image.asset(
              "assets/flutter_v.png",
              fit: BoxFit.fitHeight,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CallToActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxWidth: 1000,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(horizontal: 100),
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
