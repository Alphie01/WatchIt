import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_templates/main.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

class InfoPageSeriesDesc extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final String? desc;
  final String? name;
  final List? imgs;

  InfoPageSeriesDesc(
      {Key? key,
      this.animation,
      this.animationController,
      this.desc,
      this.imgs,
      this.name})
      : super(key: key);

  @override
  State<InfoPageSeriesDesc> createState() => _InfoPageSeriesDescState();
}

class _InfoPageSeriesDescState extends State<InfoPageSeriesDesc> {
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white.withOpacity(0.1)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppLargeText(
                                text: widget.name!,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                size: 18,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FaIcon(
                                FontAwesomeIcons.imdb,
                                color: HexColor("#F5DE50"),
                                size: 33,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppLargeText(
                                text: "7.4",
                                color: Colors.white.withOpacity(0.5),
                                fontStyle: FontStyle.italic,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AppText(
                            text: widget.desc!,
                            align: TextAlign.center,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 10, top: 10, bottom: 25),
                          color: Colors.transparent,
                          height: 180,
                          width: double.maxFinite,
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: widget.imgs!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder:
                                  (BuildContext context, int pageNameIndex) {
                                return Container(
                                  width:
                                      MediaQuery.of(context).size.width * 2 / 3,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              widget.imgs![pageNameIndex]),
                                          fit: BoxFit.cover)),
                                  margin: EdgeInsets.only(right: 10),
                                  child: Container(
                                    color: Colors.black.withOpacity(0.4),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 4, left: 4),
                                                padding: EdgeInsets.all(4),
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                child: AppText(
                                                  size: 10,
                                                  text: "Trailer",
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    top: 4, right: 4),
                                                padding: EdgeInsets.all(4),
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                child: AppText(
                                                  size: 10,
                                                  text: "3:45",
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.white),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: FaIcon(
                                              FontAwesomeIcons.play,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Container(),
                                        ]),
                                  ),
                                );
                              }),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 10, bottom: 25, right: 10),
                          width: double.maxFinite,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 6.0),
                                      child: AppText(
                                        text: "Directors",
                                        size: 18,
                                        color: Colors.white.withOpacity(.3),
                                      ),
                                    ),
                                    AppText(
                                      text: "Tony Baricroft",
                                      size: 16,
                                      color: Colors.white.withOpacity(.5),
                                    ),
                                    AppText(
                                      text: "Barry Cook",
                                      size: 16,
                                      color: Colors.white.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 6.0),
                                      child: AppText(
                                        text: "Music",
                                        size: 18,
                                        color: Colors.white.withOpacity(.3),
                                      ),
                                    ),
                                    AppText(
                                      text: "Jerry Goldsmith",
                                      size: 16,
                                      color: Colors.white.withOpacity(.5),
                                    ),
                                    AppText(
                                      text: "Warner Bros",
                                      size: 16,
                                      color: Colors.white.withOpacity(.5),
                                    ),
                                    AppText(
                                      text: "See More >>",
                                      size: 16,
                                      color: Colors.white.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 10, bottom: 25, right: 10),
                          width: double.maxFinite,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 6.0),
                                      child: AppText(
                                        text: "Starring",
                                        size: 18,
                                        color: Colors.white.withOpacity(.3),
                                      ),
                                    ),
                                    AppText(
                                      text: "Tom Cruise",
                                      size: 16,
                                      color: Colors.white.withOpacity(.5),
                                    ),
                                    AppText(
                                      text: "Tom Hanks",
                                      size: 16,
                                      color: Colors.white.withOpacity(.5),
                                    ),
                                    AppText(
                                      text: "Will Smith",
                                      size: 16,
                                      color: Colors.white.withOpacity(.5),
                                    ),
                                    AppText(
                                      text: "Jennifer Lawrence",
                                      size: 16,
                                      color: Colors.white.withOpacity(.5),
                                    ),
                                    AppText(
                                      text: "See More >>",
                                      size: 16,
                                      color: Colors.white.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 2 - 40,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 6.0),
                                      child: AppText(
                                        text: "Warnings",
                                        size: 18,
                                        color: Colors.white.withOpacity(.3),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 6.0),
                                      child: AppText(
                                        text:
                                            "This show contains scenes that some viewers may find disturbing",
                                        size: 16,
                                        color: Colors.white.withOpacity(.5),
                                      ),
                                    ),
                                    AppText(
                                      text:
                                          "Contains scenes of a sexual nature.",
                                      size: 16,
                                      color: Colors.white.withOpacity(.5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
