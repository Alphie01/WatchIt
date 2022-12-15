import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_templates/theme.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';
import 'package:theme_templates/ui_view/widget/app_text.dart';

class DownloadSmart extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final Function? changePage;
  final String? pageName;

  DownloadSmart(
      {Key? key,
      this.animation,
      this.animationController,
      this.changePage,
      this.pageName})
      : super(key: key);

  @override
  State<DownloadSmart> createState() => _DownloadSmartState();
}

class _DownloadSmartState extends State<DownloadSmart> {
  String pressedString = "";
  @override
  void initState() {
    setState(() {
      pressedString = "assets/netflix.png";
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
                width: double.maxFinite,
                padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 25),
                          width: MediaQuery.of(context).size.width - 50,
                          child: InkWell(
                            onTap: () {
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
                                                pressedString = "Everything";
                                                widget.changePage!(0);
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
                                                  padding: EdgeInsets.only(
                                                      right: 15),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.layerGroup,
                                                    size: 20,
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                AppLargeText(
                                                  text: "Everything",
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
                                                pressedString = "Movies";
                                                widget.changePage!(1);
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
                                                  padding: EdgeInsets.only(
                                                      right: 15),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.ticket,
                                                    size: 20,
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                AppLargeText(
                                                  text: "Movies",
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
                                                pressedString = "Tv Series";
                                                widget.changePage!(2);
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
                                                  padding: EdgeInsets.only(
                                                      right: 15),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.tv,
                                                    size: 20,
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                AppLargeText(
                                                  text: "Tv Series",
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
                                                pressedString = "Documentary";
                                                widget.changePage!(3);
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
                                                  padding: EdgeInsets.only(
                                                      right: 15),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.film,
                                                    size: 20,
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                AppLargeText(
                                                  text: "Documentary",
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
                                                pressedString = "Watch List";
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
                                                  padding: EdgeInsets.only(
                                                      right: 15),
                                                  child: FaIcon(
                                                    FontAwesomeIcons.check,
                                                    size: 20,
                                                    color: Colors.white
                                                        .withOpacity(0.5),
                                                  ),
                                                ),
                                                AppLargeText(
                                                  text: "Watch List",
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
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(children: [
                                  FaIcon(
                                    FontAwesomeIcons.cog,
                                    color: Colors.white,
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(left: 15),
                                      child: AppText(
                                        text: "Smart Downloading",
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ]),
                                FaIcon(
                                  FontAwesomeIcons.chevronDown,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
