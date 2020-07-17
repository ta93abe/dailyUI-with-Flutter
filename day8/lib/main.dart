/* Day 8 - 404 Page

Design Hint...

Design a 404 page.
Does it suit the brand's style?
Is it user-friendly?
It might sound mundane, but not everything can be flash or glamorous.
Every day millions of people will be landing on 404 pages.
You have an opportunity to help them in a way that's useful and aesthetically pleasing.
(It's up to you!)

 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '404 Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Home(),
      },
      onUnknownRoute: (RouteSettings settings) => MaterialPageRoute(
        builder: (context) => Page404(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            "Home Page",
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "made with Flutter",
                ),
                FlutterLogo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Page404 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(
            flex: 4,
          ),
          Image.asset("assets/404.png"),
          Spacer(
            flex: 1,
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => Home(),
              ),
              (route) => false,
            ),
            color: Colors.grey,
            hoverColor: Colors.pink,
            child: Text(
              "Go Home",
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "made with Flutter",
                ),
                FlutterLogo(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
