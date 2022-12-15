import 'package:theme_templates/theme.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeaderSetting extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  const HeaderSetting({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25, top: 10),
              child: HeaderSettings(),
            ),
          ),
        );
      },
    );
  }
}

class HeaderSettings extends StatelessWidget {
  const HeaderSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(children: [
        Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          child: Container(
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
                child: Image.asset(
                    'assets/profile.png')),
          ),
        ),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(15),
          alignment: Alignment.center,
          child: AppLargeText(
            text: 'John Doe',
            fontWeight: FontWeight.w600,
            color: Colors.white,
            size: 24,
            fontStyle: FontStyle.italic,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  children: [
                    AppLargeText(
                      text: "Viewed News",
                      color: Colors.white,
                      size: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      text: "1536",
                      color: Colors.white.withOpacity(0.7),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(width: 1,color: Colors.white,),
                        right: BorderSide(width: 1,color: Colors.white,))),
                child: Column(
                  children: [
                    AppLargeText(
                        text: "Saved News",
                        color: Colors.white,
                        size: 18,
                        fontWeight: FontWeight.w600),
                    AppText(
                      text: "343",
                      color: Colors.white.withOpacity(0.7),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  children: [
                    AppLargeText(
                        text: "Liked News",
                        color: Colors.white,
                        size: 18,
                        fontWeight: FontWeight.w600),
                    AppText(
                      text: "566",
                      color: Colors.white.withOpacity(0.7),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
