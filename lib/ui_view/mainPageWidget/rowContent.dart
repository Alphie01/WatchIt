import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:theme_templates/theme_home_screen.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

class RowContent extends StatefulWidget {
  const RowContent(
      {Key? key,
      this.mainScreenAnimationController,
      this.mainScreenAnimation,
      this.pagecount = 0,
      required this.newsImg})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  final List newsImg;
  final int pagecount;

  @override
  State<RowContent> createState() => _RowContentState();
}

class _RowContentState extends State<RowContent> {
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
                      left: 25, top: 8, right: 25, bottom: 8),
                  child: ColumnWatch(
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

class ColumnWatch extends StatelessWidget {
  final List newsImg;
  final AnimationController? animationController;
  final Animation? animation;
  final int? pagecount;

  ColumnWatch(
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
                      width: MediaQuery.of(context).size.width / 3 - 40,
                      height: MediaQuery.of(context).size.height / 5,
                      child: Container(
                          width: double.maxFinite,
                          color: Colors.black.withOpacity(0.45),
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: AppText(
                              text: newsImg[index]['name'],
                              color: Colors.white,
                              maxLineCount: 2,
                              size: 14,
                              fontStyle: FontStyle.italic,
                            ),
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
