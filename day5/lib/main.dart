/* Day 5 - App Icon

Design Hint...

Design an app icon.
What best represents the brand or product?
Or is it incredibly unique?
Does it look great at a distance and does it stand out when put on your home screen alongside other apps?

 */

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Icon',
      debugShowCheckedModeBanner: false,
      home: AppIcon(),
    );
  }
}

enum Status {
  large,
  small,
  single,
  double,
}

class AppIcon extends StatefulWidget {
  @override
  _AppIconState createState() => _AppIconState();
}

class _AppIconState extends State<AppIcon> {
  Status _status;

  String status(s) {
    switch (s) {
      case Status.large:
        return "large scale";
        break;
      case Status.small:
        return "small scale";
        break;
      case Status.single:
        return "rotation";
        break;
      case Status.double:
        return "rotation double";
        break;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BackgroundInfo(),
          Center(
            child: GestureDetector(
              behavior: HitTestBehavior.deferToChild,
              child: FlareActor(
                "assets/move.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: status(_status),
              ),
              onTap: () {
                setState(() {
                  _status = Status.single;
                });
              },
              onDoubleTap: () {
                setState(() {
                  _status = Status.double;
                });
              },
              onLongPressStart: (_) {
                setState(() {
                  _status = Status.large;
                });
              },
              onLongPressEnd: (_) {
                setState(() {
                  _status = Status.small;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "made with Flutter",
              ),
              FlutterLogo(),
            ],
          ),
        ],
      ),
    );
  }
}
