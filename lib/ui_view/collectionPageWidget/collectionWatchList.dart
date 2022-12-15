import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_templates/bottom_navigation_view/contents.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

class CollectionWatchList extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;

  CollectionWatchList({Key? key, this.animation, this.animationController})
      : super(key: key);

  @override
  State<CollectionWatchList> createState() => _CollectionWatchListState();
}

class _CollectionWatchListState extends State<CollectionWatchList> {
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
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 25),
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 3 / 5,
                                crossAxisCount: 3),
                        itemCount: movies[0].length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        tvSeries[0][index]["imgs"][0]),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              alignment: Alignment.topRight,
                              color: Colors.black.withOpacity(.3),
                              child: Container(
                                  margin: EdgeInsets.only(top: 10, right: 10),
                                  child: FaIcon(
                                    FontAwesomeIcons.solidHeart,
                                    color: Colors.white,
                                    size: 18,
                                  )),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
