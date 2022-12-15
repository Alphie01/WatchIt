import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:theme_templates/main.dart';
import 'package:flutter/material.dart';


class settingsApp extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const settingsApp({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25, top: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppLargeText(
                        text: "Name",
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      Text("John Doe")
                    ],
                  ),
                  Divider(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppLargeText(
                        text: "Email Adress",size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      Text("john.doe@gmail.com")
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppLargeText(
                        text: "Date Of Birth",size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      Text("01.01.1970")
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppLargeText(
                        text: "Password",size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      Text("*********")
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
