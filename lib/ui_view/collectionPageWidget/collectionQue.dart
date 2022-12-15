import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_templates/bottom_navigation_view/contents.dart';
import 'package:theme_templates/theme.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

class CollectionQue extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final Function? changePage;
  final String? pageName;

  int randomNumber = Random().nextInt(10) + 35;

  int match = Random().nextInt(19) + 80;

  bool randomBool = Random().nextBool();

  CollectionQue(
      {Key? key,
      this.animation,
      this.animationController,
      this.changePage,
      this.pageName})
      : super(key: key);

  @override
  State<CollectionQue> createState() => _CollectionQueState();
}

class _CollectionQueState extends State<CollectionQue> {
  List imgList = [];
  int lineCount = 2;
  bool showBar = false;
  @override
  void initState() {
    getRandomContents();
    // TODO: implement initState
    super.initState();
  }

  void getRandomContents() {
    for (var i = 0; i < 3; i++) {
      int first = Random().nextInt(movies.length);
      int second = Random().nextInt(6);
      imgList.add(movies[first][second]);
      imgList.add(tvSeries[first][second]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: Transform(
              transform: Matrix4.translationValues(
                  0.0, 30 * (1.0 - widget.animation!.value), 0.0),
              child: Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imgList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (() {}),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      NetworkImage(imgList[index]['imgs'][0]))),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.7,
                          child: Container(
                            width: double.maxFinite,
                            height: MediaQuery.of(context).size.height / 2.7,
                            color: Colors.black.withOpacity(.75),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: List.generate(imgList.length,
                                      (indexSlide) {
                                    return Container(
                                      margin: const EdgeInsets.only(right: 2),
                                      height: 8,
                                      width: index == indexSlide ? 25 : 8,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: index == indexSlide
                                              ? Colors.white
                                              : Colors.white.withOpacity(0.5)),
                                    );
                                  }),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                2 /
                                                4,
                                            child: AppLargeText(
                                              text: imgList[index]['name'],
                                              color: Colors.white,
                                              size: 22,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              if (showBar) {
                                                setState(() {
                                                  showBar = !showBar;
                                                  lineCount = 2;
                                                });
                                              } else {
                                                setState(() {
                                                  showBar = !showBar;
                                                  lineCount = 5;
                                                });
                                              }
                                            },
                                            child: FaIcon(
                                              showBar
                                                  ? FontAwesomeIcons.chevronDown
                                                  : FontAwesomeIcons.chevronUp,
                                              color: Colors.white,
                                              size: 22,
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: AppText(
                                          text:
                                              "Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur suscipit expedita aperiam sapiente incidunt eveniet provident vero accusantium. Fugit aperiam placeat id, quidem, sit aspernatur nemo qui assumenda possimus blanditiis animi delectus sed quam voluptate dolorem debitis! Hic blanditiis fuga doloremque illum harum incidunt aliquid nesciunt molestiae ducimus veniam suscipit facilis, voluptatum, accusamus totam consectetur qui at, repellendus reprehenderit sunt odio impedit commodi id?",
                                          size: 14,
                                          color: Colors.white.withOpacity(.6),
                                          maxLineCount: lineCount,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )),
        );
      },
    );
  }
}
