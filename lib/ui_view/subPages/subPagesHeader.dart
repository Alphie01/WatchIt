import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_templates/theme.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

class SubPagesHeader extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final List? imgAsset;

  SubPagesHeader(
      {Key? key, this.animation, this.animationController, this.imgAsset})
      : super(key: key);

  @override
  State<SubPagesHeader> createState() => _SubPagesHeaderState();
}

class _SubPagesHeaderState extends State<SubPagesHeader> {
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
                height: MediaQuery.of(context).size.height * 3 / 5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(15)),
                    image: DecorationImage(
                        image: NetworkImage(widget.imgAsset?[0]),
                        fit: BoxFit.cover)),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(25)),
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 10),
                              child: FaIcon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(1),
                                  borderRadius: BorderRadius.circular(25)),
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.play,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  AppLargeText(
                                    text: "Play",
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    size: 14,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(25)),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 10, bottom: 10),
                          child: FaIcon(
                            FontAwesomeIcons.ellipsisVertical,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                  ),
                ),
              )),
        );
      },
    );
  }
}
