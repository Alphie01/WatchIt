import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

class LastComments extends StatelessWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final List? newsCommentsList;

  const LastComments(
      {Key? key,
      this.animationController,
      this.animation,
      this.newsCommentsList})
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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
              
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: newsCommentsList!.length,
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int pageNameIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: Colors.black.withOpacity(0.2)))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            newsCommentsList![pageNameIndex]
                                                ['imgs']),
                                        fit: BoxFit.fitWidth,
                                        filterQuality: FilterQuality.high),
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppLargeText(
                                        text: newsCommentsList![pageNameIndex]
                                            ['name'],
                                        size: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      AppText(
                                        color: Colors.white.withOpacity(.7),
                                          text: newsCommentsList![pageNameIndex]
                                              ['comments'])
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
