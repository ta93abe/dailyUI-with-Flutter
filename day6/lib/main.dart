/* Day 6 - User Profile

Design Hint...

Design a user profile and be mindful of the most important data, names, imagery, placement, etc.
Is it for a serious profile?
A social profile?
(It's up to you!)

 */

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: UserProfile(),
    );
  }
}

final socialLinks = [
  {
    "name": "website",
    "icon": FontAwesome.at,
    "color": Colors.deepPurpleAccent,
    "url": "https://ta93abe.com/",
  },
  {
    "name": "Twitter",
    "icon": FontAwesome.twitter,
    "color": Colors.lightBlue,
    "url": "https://twitter.com/ta93_abe",
  },
  {
    "name": "Github",
    "icon": FontAwesome.github,
    "color": Colors.black,
    "url": "https://github.com/ta93abe",
  },
  {
    "name": "Dibbble",
    "icon": FontAwesome.dribbble,
    "color": Colors.pinkAccent,
    "url": "https://dribbble.com/ta93abe",
  },
  {
    "name": "Behance",
    "icon": FontAwesome.behance,
    "color": Colors.blue,
    "url": "https://www.behance.net/ta93abe",
  },
  {
    "name": "Instagram",
    "icon": FontAwesome.instagram,
    "color": Colors.pink,
    "url": "https://www.instagram.com/ta93abe/",
  },
  {
    "name": "500px",
    "icon": FontAwesome.$500px,
    "color": Colors.black,
    "url": "https://500px.com/ta93abe",
  },
];

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/kurage.png"),
            foregroundColor: Colors.black,
            radius: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Bokuh Ito",
              style: GoogleFonts.indieFlower(
                fontSize: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Realize Philosophy",
              style: GoogleFonts.satisfy(),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
            ),
            itemCount: socialLinks.length,
            itemBuilder: (context, index) {
              return SocialButton(
                color: socialLinks[index]["color"],
                icon: socialLinks[index]["icon"],
                launchUrl: socialLinks[index]["url"],
              );
            },
          ),
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
    );
  }
}

class SocialButton extends StatelessWidget {
  final String launchUrl;
  final IconData icon;
  final Color color;

  SocialButton({this.launchUrl, this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FlatButton(
        shape: CircleBorder(),
        color: color,
        onPressed: () => launch(launchUrl),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
