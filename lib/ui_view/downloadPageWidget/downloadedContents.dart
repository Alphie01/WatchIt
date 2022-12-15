import 'dart:math';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_templates/bottom_navigation_view/contents.dart';
import 'package:theme_templates/theme_home_screen.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

class DownloadContents extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  DownloadContents({Key? key, this.animationController, this.animation})
      : super(key: key);

  @override
  State<DownloadContents> createState() => _DownloadContentsState();
}

class _DownloadContentsState extends State<DownloadContents> {
  List imgList = [];

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
              padding: EdgeInsets.only(top: 20),
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
                    return SearchContainer(
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

class SearchContainer extends StatefulWidget {
  final int? goesTo;
  final List? imgAsset;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final String? episodeName;
  final String? episodedesc;

  int randomNumber = Random().nextInt(10) + 35;

  int match = Random().nextInt(19) + 80;

  int downloadedContents = Random().nextInt(5) + 2;
  int downloadedStartContents = Random().nextInt(4) + 1;
  int downloadedSeason = Random().nextInt(3) + 1;

  bool randomBool = Random().nextBool();
  SearchContainer(
      {Key? key,
      this.goesTo,
      this.imgAsset,
      this.animation,
      this.animationController,
      this.episodedesc,
      this.episodeName})
      : super(key: key);

  @override
  State<SearchContainer> createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  int lineCount = 3;
  bool showBar = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(bottom: 20, right: 25, left: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
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
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 100,
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
            width: MediaQuery.of(context).size.width * 2 / 4 + 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    )
                  ],
                ),
                widget.goesTo == 1
                    ? Container(
                      padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              text: "Movie Downloaded",
                              size: 12,
                              color: Colors.white.withOpacity(.4),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.green),
                                    borderRadius: BorderRadius.circular(50)),
                                child: FaIcon(
                                  FontAwesomeIcons.check,
                                  size: 12,
                                  color: Colors.green,
                                ))
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.downloadedContents,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int pageNameIndex) {
                          var pressed =
                              widget.downloadedStartContents + pageNameIndex;
                          return Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText(
                                  text:
                                      "${widget.downloadedSeason}. Season ${pressed} Episode",
                                  size: 12,
                                  color: Colors.white.withOpacity(.4),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.green),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: FaIcon(
                                      FontAwesomeIcons.check,
                                      size: 12,
                                      color: Colors.green,
                                    ))
                              ],
                            ),
                          );
                        }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
