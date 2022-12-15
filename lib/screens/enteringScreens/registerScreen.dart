import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_templates/screens/enteringScreens/login.dart';
import 'package:theme_templates/screens/subPages/loading.dart';
import 'package:theme_templates/theme.dart';

class registerPage extends StatelessWidget {






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 35,
            width: double.maxFinite,
            height: 35,
            child: Container(
                child: ListView.builder(
              itemCount: 4,
              itemBuilder: (_, index) {
                return Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 15,
                        height: 15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(index.toString()),
                      )
                    ],
                  ),
                );
              },
            )),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/register.jpg'),
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
                  "Welcome!",
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
                      "Welcome To The Club!",
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
                      hintText: "E-mail",
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
                    child:  Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )
                        
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Do You Have an Account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    FlatButton(
                      onPressed: () => Navigator.pushReplacement(
                        //Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      ),
                      child: Text(
                        "Log In",
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
          ),        ],
      ),
    );
  }
}
