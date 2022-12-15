import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_templates/theme.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

class HeaderThumbnailWidget extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final String? imgAsset;
  final String logoAsset;

  HeaderThumbnailWidget(
      {Key? key, this.animation, this.animationController, this.imgAsset,required this.logoAsset})
      : super(key: key);

  @override
  State<HeaderThumbnailWidget> createState() => _HeaderThumbnailWidgetState();
}

class _HeaderThumbnailWidgetState extends State<HeaderThumbnailWidget> {
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
                height: MediaQuery.of(context).size.height * 3 / 4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.imgAsset!),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    OnlineTvTheme.background.withOpacity(0),
                    OnlineTvTheme.background.withOpacity(0.6),
                    OnlineTvTheme.background.withOpacity(0.8),
                    OnlineTvTheme.background.withOpacity(1),
                    OnlineTvTheme.background.withOpacity(1),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  padding: EdgeInsets.only(
                      bottom: 15,
                      right: MediaQuery.of(context).size.width / 5,
                      left: MediaQuery.of(context).size.width / 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(widget.logoAsset),
                                fit: BoxFit.contain)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: AppText(
                                text: "NEW",
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: AppText(
                                text: "Sci-Fi",
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 5, bottom: 5),
                              child: AppText(
                                text: "2020",
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    size: 22,
                                  ),
                                ],
                              ),
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
                                  FontAwesomeIcons.info,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        );
      },
    );
  }
}
