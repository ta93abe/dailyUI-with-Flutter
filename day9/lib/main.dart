/* Day 9 - Music Player

Design Hint...

Design a music player.
Consider the controls, placements, imagery such as the artist or album cover, etc.
Also, consider the device type that's playing the music.
A dashboard in a tourbus, a smartwatch, or via a web browser.
Each device type will have different requirements, features, and restrictions to consider.

 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Player(),
    );
  }
}

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(
            flex: 2,
          ),
          CircleAvatar(
            foregroundColor: Colors.pink,
            radius: 100,
          ),
          Spacer(
            flex: 2,
          ),
          Text(
            "Title",
            style: TextStyle(
              fontSize: 50,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("00:00"),
              Text("/"),
              Text("12:34"),
            ],
          ),
          Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.fast_rewind,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.replay_10,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.play_arrow,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.forward_10,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.fast_forward,
                ),
                onPressed: () {},
              ),
            ],
          ),
          Spacer(
            flex: 1,
          ),
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
