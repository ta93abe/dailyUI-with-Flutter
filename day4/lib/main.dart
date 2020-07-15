/* Day 4 - Calculator

Design Hint...

Design a calculator. Standard, scientific, or specialty calculator for something such as a mortgage?
Is it for a phone, a tablet, a web app?

 */

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CalculatorView(),
    );
  }
}

class CalculatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 10,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                color: Colors.black,
              ),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Table(
            children: [
              TableRow(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.grey,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "7",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.grey,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "8",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.grey,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "9",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.orange,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "+",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.grey,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "4",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.grey,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "5",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.grey,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "6",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.orange,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "-",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.grey,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "1",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.grey,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "2",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.grey,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "3",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.orange,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "×",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.orange,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        ".",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.grey,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "0",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.orange,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "=",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    child: FlatButton(
                      color: Colors.orange,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Text(
                        "÷",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
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
