import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:theme_templates/main.dart';
import 'package:theme_templates/theme.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,

      children: [
        Container(
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: OnlineTvTheme.nearlyDarkBlue,
            gradient: LinearGradient(colors: [
              OnlineTvTheme.nearlyDarkBlue,
              HexColor('#6A88E5'),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: OnlineTvTheme.nearlyDarkBlue,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(60)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Image.asset('assets/profile.png')),
                ),
                SizedBox(
                  height: 15,
                ),
                AppLargeText(
                  text: "John Doe",
                  size: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 5,
                ),
                AppText(
                  text: "Reader - Writer",
                  size: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText(
                text: "Dark Mode",
                color: Colors.white,
              ),
              Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = !isSwitched;
                  });
                },
                activeTrackColor: Colors.white38,
                activeColor: Colors.white,
              )
            ],
          ),
        ),
        ListTile(
          title: Row(
            children: [
              Icon(
                Icons.plus_one,
                color: Colors.white,
              ),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  child: AppText(text: 'Add New Post', color: Colors.white))
            ],
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: AppText(text: 'Settings', color: Colors.white),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: AppText(text: 'Add New Account', color: Colors.white),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: AppText(text: 'Sign Out', color: Colors.white),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    );
  }
}
