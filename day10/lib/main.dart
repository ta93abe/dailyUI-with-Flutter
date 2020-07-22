/* Day 10 - Social Share

Design Hint...

Design a social share button/icon and be mindful of the size, imagery, placement, and purpose for sharing.

 */

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Share',
      debugShowCheckedModeBanner: false,
      home: SocialShare(),
    );
  }
}

class SocialShare extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Social Share'),
      ),
      body: Column(
        children: [
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(
                color: Colors.tealAccent,
                child: Text("Share"),
                onPressed: () {
                  Share.share('check out my website https://ta93abe.com',
                      subject: 'Look what I made!');
                },
              ),
              FlatButton(
                color: Colors.pinkAccent,
                child: Text("Custom Share"),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    enableDrag: true,
                    backgroundColor: Colors.white.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    builder: (context) => Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: FlatButton(
                                    shape: CircleBorder(),
                                    splashColor: Colors.transparent,
                                    color: Colors.white,
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    child: Icon(Icons.close),
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Spacer(),
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            Spacer(),
                            SelectableText(
                              "https://ta93abe.com",
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                FlatButton(
                                  onPressed: () {},
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                  color: Colors.lightBlueAccent,
                                  child: Icon(
                                    FontAwesome.twitter,
                                    color: Colors.white,
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                  color: Colors.purple,
                                  child: Icon(
                                    FontAwesome.instagram,
                                    color: Colors.white,
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                  color: Colors.blueAccent,
                                  child: Icon(
                                    FontAwesome.facebook,
                                    color: Colors.white,
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(15),
                                  color: Colors.red,
                                  child: Icon(
                                    FontAwesome.youtube_play,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
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
