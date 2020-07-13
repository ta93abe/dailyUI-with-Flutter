/* Day 1 - SignUp
Design Hint...

Create a sign up page, modal, form, or app screen related to signing up for something.
It could be for a volunteer event, contest registration, a giveaway, or anything you can image.
 */

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sign up',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        dividerColor: Colors.white,
        dividerTheme: DividerThemeData(
          indent: 30,
          endIndent: 30,
        ),
      ),
      home: SignUp(),
    );
  }
}

class SignUp extends StatelessWidget {
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(
                flex: 2,
              ),
              Center(
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.dancingScript(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
              Spacer(
                flex: 2,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: TextFormField(
                  cursorColor: Colors.white,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    labelText: "email",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: TextFormField(
                  obscureText: true,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.all_inclusive,
                      color: Colors.white,
                    ),
                    labelText: "password",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: FlatButton(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  onPressed: () {},
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "sign up",
                  ),
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Divider(),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Image.asset(
                      "assets/google.png",
                      width: 50,
                    ),
                    shape: CircleBorder(),
                  ),
                  RaisedButton(
                    padding: EdgeInsets.all(12),
                    color: Colors.black,
                    onPressed: () {},
                    child: Icon(
                      FontAwesome.apple,
                      color: Colors.white,
                      size: 30,
                    ),
                    shape: CircleBorder(),
                  ),
                  RaisedButton(
                    color: Colors.pinkAccent,
                    onPressed: () {},
                    child: Image.asset(
                      "assets/dribbble.png",
                      width: 50,
                    ),
                    shape: CircleBorder(),
                  ),
                ],
              ),
              Spacer(
                flex: 1,
              ),
              FlatButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I already have an account",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      size: 15,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Spacer(
                flex: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
        ),
      ),
    );
  }
}
