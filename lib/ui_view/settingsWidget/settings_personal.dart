import 'package:flutter/cupertino.dart';
import 'package:theme_templates/main.dart';
import 'package:flutter/material.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';

class settingsPersonal extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const settingsPersonal({Key? key, this.animationController, this.animation})
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
                        text: "Allow Notifications?",
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      Text("Yes")
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
                        text: "Allow Location?",
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      Text("Yes")
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
                        text: "Allow Tracking Your Movements?",
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      Text("No")
                    ],
                  ),
                  SizedBox(
                    height: 5,
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
