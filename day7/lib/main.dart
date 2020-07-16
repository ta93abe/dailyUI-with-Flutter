/* Settings

Design Hint...

Design settings for something.
Is it for security or privacy settings? Game settings?
What is it and what's important?
(It's up to you!)

 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Settings',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ),
      home: Home(),
    );
  }
}

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          Spacer(),
          SettingButton(
            title: "account info",
          ),
          SettingButton(
            title: "edit account",
          ),
          Spacer(),
          SettingButton(
            title: "app info",
          ),
          Spacer(),
          SettingButton(
            title: "app info",
          ),
          SettingButton(
            title: "developer info",
          ),
          SettingButton(
            title: "designer info",
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
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

class SettingButton extends StatelessWidget {
  final String title;

  SettingButton({this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      elevation: 0.0,
      splashColor: Colors.pink,
      height: 60,
      onPressed: () {},
      color: Colors.grey,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(title),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
            ),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => Settings(),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("made with Flutter"),
                    FlutterLogo(),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: Text('Settings'),
          ),
        ],
      ),
    );
  }
}
