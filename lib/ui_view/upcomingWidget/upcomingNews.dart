import 'dart:math';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_templates/bottom_navigation_view/contents.dart';
import 'package:theme_templates/theme.dart';
import 'package:theme_templates/theme_home_screen.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

class UpcomingNews extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  UpcomingNews({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  State<UpcomingNews> createState() => _UpcomingNewsState();
}

class _UpcomingNewsState extends State<UpcomingNews> {
  List imgList = [];

  @override
  void initState() {
    getRandomContents();
    print(imgList.length);
    // TODO: implement initState
    super.initState();
  }

  void getRandomContents() {
    for (var i = 0; i < 8; i++) {
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
              padding: EdgeInsets.only(top: 10),
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(25)),
              ),
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: imgList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int pageNameIndex) {
                    var episodeName =
                        " :  Episode " + (pageNameIndex + 1).toString();
                    return UpcomingNewsContainer(
                      goesTo: pageNameIndex % 2 == 0 ? 1 : 2,
                      episodeName: imgList[pageNameIndex]['name'],
                      episodedesc: imgList[pageNameIndex]['description'],
                      animation: widget.animation,
                      animationController: widget.animationController,
                      imgAsset: imgList[pageNameIndex]['imgs'],
                    );
                  }),
            ),
          ),
        );
      },
    );
  }
}

class UpcomingNewsContainer extends StatefulWidget {
  final int? goesTo;
  final List? imgAsset;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final String? episodeName;
  final String? episodedesc;

  int randomNumber = Random().nextInt(10) + 35;

  int match = Random().nextInt(19) + 80;

  bool randomBool = Random().nextBool();
  UpcomingNewsContainer(
      {Key? key,
      this.goesTo,
      this.imgAsset,
      this.animation,
      this.animationController,
      this.episodedesc,
      this.episodeName})
      : super(key: key);

  @override
  State<UpcomingNewsContainer> createState() => _UpcomingNewsContainerState();
}

class _UpcomingNewsContainerState extends State<UpcomingNewsContainer> {
  int lineCount = 3;
  bool showBar = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(bottom: 20, right: 25, left: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              /*
                widget.animationController?.reverse().then<dynamic>((data) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnlineTvHomeScreen(
                                pagecount: widget.goesTo!,
                                watchname: widget.episodeName,
                                watchdesc: widget.episodedesc,
                                watchimgs: widget.imgAsset,
                              )));
                });*/
            },
            child: Container(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height/3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(widget.imgAsset![0]),
                      fit: BoxFit.cover)),
              child: Container(
                color: Colors.black.withOpacity(0.4),
                alignment: Alignment.center,
                child: Container(
                  child: FaIcon(
                    FontAwesomeIcons.play,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(4),
                      color: widget.randomBool
                          ? Colors.green.withOpacity(0.4)
                          : OnlineTvTheme.nearlyDarkBlue.withOpacity(0.6),
                      child: AppText(
                        text: widget.randomBool ? "New Season" : "New Series",
                        color: widget.randomBool
                            ? Colors.white.withOpacity(1)
                            : Colors.white.withOpacity(1),
                        size: 10,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      color: Colors.black.withOpacity(0.6),

                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      width: MediaQuery.of(context).size.width * 2 / 4,
                      child: AppLargeText(
                        text: widget.episodeName!,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (showBar) {
                          setState(() {
                            showBar = !showBar;
                            lineCount = 3;
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
                    size: 10,
                    color: Colors.white.withOpacity(.4),
                    maxLineCount: lineCount,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
