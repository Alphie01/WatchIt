import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:theme_templates/theme_home_screen.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';
import 'dart:math';

class RecentWatched extends StatefulWidget {
  const RecentWatched(
      {Key? key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      this.pagecount,
      required this.newsImg})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  final List newsImg;
  final int? pagecount;

  @override
  State<RecentWatched> createState() => _RecentWatchedState();
}

class _RecentWatchedState extends State<RecentWatched> {
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
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25, top: 20, right: 25, bottom: 20),
                  child: ColumnRecentWatch(
                    pagecount: widget.pagecount,
                    newsImg: widget.newsImg,
                    animationController: widget.mainScreenAnimationController,
                    animation: widget.mainScreenAnimation,
                  )),
            ));
      },
    );
  }
}

class ColumnRecentWatch extends StatelessWidget {
  final List newsImg;
  final AnimationController? animationController;
  final Animation? animation;
  final int? pagecount;

  ColumnRecentWatch(
      {Key? key,
      required this.newsImg,
      this.animationController,
      this.pagecount,
      this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.of(context).size.height / 4,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: newsImg.length,
          itemBuilder: (BuildContext context, int index) {
            var random = 0.75 - (index * 0.1);
            return RaisedButton(
              color: Colors.transparent,
              padding: const EdgeInsets.all(0),
              onPressed: (() {
                animationController?.reverse().then<dynamic>((data) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OnlineTvHomeScreen(
                                pagecount: pagecount!,
                                watchname: newsImg[index]['name'],
                                watchdesc: newsImg[index]['description'],
                                watchimgs: newsImg[index]['imgs'],
                              )));
                });
              }),
              child: Padding(
                padding: const EdgeInsets.only(right: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(newsImg[index]['imgs'][0]))),
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      height: MediaQuery.of(context).size.height / 4,
                      child: Container(
                          width: double.maxFinite,
                          color: Colors.black.withOpacity(0.45),
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AppText(
                                  text: newsImg[index]['name'],
                                  color: Colors.white,
                                  maxLineCount: 2,
                                  size: 14,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Container(
                                  child: LinearProgressIndicator(
                                    backgroundColor: Colors.black,
                                    color: Colors.white,
                                    value: random,
                                    semanticsLabel: 'Linear progress indicator',
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
