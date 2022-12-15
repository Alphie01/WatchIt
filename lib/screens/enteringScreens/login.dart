import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_templates/screens/enteringScreens/registerScreen.dart';


import 'package:theme_templates/screens/subPages/loading.dart';
import 'package:theme_templates/theme.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _phoneNumber = '';

  var SendedObj;

  var kullanici_mail = '';

  var Kullanici_pass = '';

  var loading = 0;

  void closeinfos() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/login.jpg'),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff161d27).withOpacity(1),
              Color(0xff161d27).withOpacity(0.7),
              Color(0xff161d27).withOpacity(0.7),
              Color(0xff161d27).withOpacity(1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 50, right: 50),
                    child: Text(
                      "We Are Glad To See You Again",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    onChanged: (news) {
                    },
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "E-mail or Phone Number",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      filled: true,
                      prefixText: ' ',
                      fillColor: Color(0xff161d27).withOpacity(0.9),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: OnlineTvTheme.nearlyDarkBlue)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: OnlineTvTheme.nearlyDarkBlue)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: TextField(
                    onChanged: (pass) {},
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      filled: true,
                      prefixText: ' ',
                      fillColor: Color(0xff161d27).withOpacity(0.9),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: OnlineTvTheme.nearlyDarkBlue)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: OnlineTvTheme.nearlyDarkBlue)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 40, right: 40),
                  child: FlatButton(
                    onPressed: () {},
                    color: OnlineTvTheme.nearlyDarkBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: loading == 0
                        ? Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        : CircularProgressIndicator(
                            color: Colors.white,
                          ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Is This Your First Time Logging In?",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    FlatButton(
                      onPressed: () => Navigator.pushReplacement(
                        //Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => registerPage()),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: OnlineTvTheme.nearlyDarkBlue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Continue Without Login",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    FlatButton(
                      onPressed: () => Navigator.pushReplacement(
                        //Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loading()),
                      ),
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: OnlineTvTheme.nearlyDarkBlue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
