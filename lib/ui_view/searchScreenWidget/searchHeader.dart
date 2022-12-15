import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:theme_templates/main.dart';
import 'package:theme_templates/theme.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'dart:math' as math;
import 'package:theme_templates/theme.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

class SearchHeader extends StatefulWidget {
  SearchHeader(
      {Key? key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      required this.onChangeFunction})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  final Function onChangeFunction;

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5, bottom: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
                  color: OnlineTvTheme.nearlyDarkBlue,
                  gradient: LinearGradient(colors: [
                    OnlineTvTheme.nearlyDarkBlue,
                    HexColor('#6A88E5'),
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppLargeText(
                      text: "Search",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      size: 26,
                      fontStyle: FontStyle.italic,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 25, right: 25),
                      child: TextField(
                        
                        onChanged: (name) {
                          widget.onChangeFunction(name);
                        },
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Search",
                          hintStyle: TextStyle(color: Colors.black),
                          filled: true,
                          prefixText: ' ',
                          fillColor: Colors.white.withOpacity(0.4),
                          enabledBorder: OutlineInputBorder(
                              
                              borderRadius: BorderRadius.circular(15)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
