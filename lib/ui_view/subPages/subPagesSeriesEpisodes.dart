import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_templates/main.dart';
import 'package:theme_templates/theme.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

class InfoPageSeriesEpisodes extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final String? desc;
  final String? name;
  final List? imgs;

  InfoPageSeriesEpisodes(
      {Key? key,
      this.animation,
      this.animationController,
      this.desc,
      this.imgs,
      this.name})
      : super(key: key);

  @override
  State<InfoPageSeriesEpisodes> createState() => _InfoPageSeriesEpisodesState();
}

class _InfoPageSeriesEpisodesState extends State<InfoPageSeriesEpisodes> {
  String seasonCount = "";
  @override
  void initState() {
    setState(() {
      seasonCount = "Season 2";
    });
    // TODO: implement initState
    super.initState();
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: AppText(
                          text: "1998",
                          size: 12,
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: AppText(
                            text: "1h 28m",
                            size: 12,
                            color: Colors.white.withOpacity(0.4)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: AppText(
                            text: "Pj-12",
                            size: 12,
                            color: Colors.white.withOpacity(0.4)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: AppText(
                            text: "CC",
                            size: 12,
                            color: Colors.white.withOpacity(0.4)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: AppText(
                            text: "HD",
                            size: 12,
                            color: Colors.white.withOpacity(0.4)),
                      )
                    ],
                  ),
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
                        InkWell(
                          onTap: (() {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    width: double.maxFinite,
                                    height: 250,
                                    decoration: BoxDecoration(
                                        color: OnlineTvTheme.background,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(5))),
                                    child: Column(
                                      children: [
                                        RaisedButton(
                                          color: Colors.transparent,
                                          onPressed: () {
                                            setState(() {
                                              seasonCount = "Season 1";
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 15),
                                                child: FaIcon(
                                                  FontAwesomeIcons.layerGroup,
                                                  size: 20,
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              AppLargeText(
                                                text: "Season 1",
                                                size: 16,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RaisedButton(
                                          color: Colors.transparent,
                                          onPressed: () {
                                            setState(() {
                                              seasonCount = "Season 2";
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 15),
                                                child: FaIcon(
                                                  FontAwesomeIcons.ticket,
                                                  size: 20,
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              AppLargeText(
                                                text: "Season 2",
                                                size: 16,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RaisedButton(
                                          color: Colors.transparent,
                                          onPressed: () {
                                            setState(() {
                                              seasonCount = "Season 3";
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 15),
                                                child: FaIcon(
                                                  FontAwesomeIcons.tv,
                                                  size: 20,
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              AppLargeText(
                                                text: "Season 3",
                                                size: 16,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RaisedButton(
                                          color: Colors.transparent,
                                          onPressed: () {
                                            setState(() {
                                              seasonCount = "Season 4";
                                            });
                                            Navigator.pop(context);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(right: 15),
                                                child: FaIcon(
                                                  FontAwesomeIcons.film,
                                                  size: 20,
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                              AppLargeText(
                                                text: "Season 4",
                                                size: 16,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          }),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AppLargeText(
                                  text: seasonCount,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  size: 18,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: FaIcon(
                                  FontAwesomeIcons.chevronDown,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color: Colors.black
                                                .withOpacity(0.3)))),
                                padding: const EdgeInsets.all(8),
                                child: AppText(
                                  text: "Action",
                                  size: 12,
                                  color: Colors.white.withOpacity(0.4),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color: Colors.black
                                                .withOpacity(0.3)))),
                                padding: const EdgeInsets.all(8),
                                child: AppText(
                                    text: "Animation",
                                    size: 12,
                                    color: Colors.white.withOpacity(0.4)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 1,
                                            color: Colors.black
                                                .withOpacity(0.3)))),
                                padding: const EdgeInsets.all(8),
                                child: AppText(
                                    text: "Comedy",
                                    size: 12,
                                    color: Colors.white.withOpacity(0.4)),
                              ),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: AppText(
                                    text: "Musical",
                                    size: 12,
                                    color: Colors.white.withOpacity(0.4)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: double.maxFinite,
                          child: ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: 6,
                              scrollDirection: Axis.vertical,
                              itemBuilder:
                                  (BuildContext context, int pageNameIndex) {
                                var episodeName = widget.name! +
                                    " : "+ seasonCount + " Episode " +
                                    (pageNameIndex + 1).toString();
                                return EpisodeContainer(
                                  episodeName: episodeName,
                                  animation: widget.animation,
                                  animationController:
                                      widget.animationController,
                                  imgAsset: widget.imgs![0],
                                );
                              }),
                        )
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

class EpisodeContainer extends StatefulWidget {
  final String? imgAsset;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final String? episodeName;

  int randomNumber = Random().nextInt(10) + 35;

  bool randomBool = Random().nextBool();
  EpisodeContainer(
      {Key? key,
      this.imgAsset,
      this.animation,
      this.animationController,
      this.episodeName})
      : super(key: key);

  @override
  State<EpisodeContainer> createState() => _EpisodeContainerState();
}

class _EpisodeContainerState extends State<EpisodeContainer> {
  int lineCount = 2;
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
          Container(
            width: MediaQuery.of(context).size.width / 4,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(widget.imgAsset!), fit: BoxFit.cover)),
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
                      padding: EdgeInsets.all(4),
                      color: widget.randomBool
                          ? Colors.green.withOpacity(0.4)
                          : Colors.black.withOpacity(0.6),
                      child: AppText(
                        text: widget.randomBool ? "Downloaded" : "Download",
                        color: widget.randomBool
                            ? Colors.white.withOpacity(1)
                            : Colors.white.withOpacity(0.6),
                        size: 10,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4),
                      color: Colors.black.withOpacity(0.6),
                      child: AppText(
                        text: widget.randomNumber.toString() + " mins",
                        color: Colors.white.withOpacity(0.6),
                        size: 10,
                      ),
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
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.black,
                    color: Colors.white,
                    value: (widget.randomNumber / 100),
                    semanticsLabel: 'Linear progress indicator',
                  ),
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
