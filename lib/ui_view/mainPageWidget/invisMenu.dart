import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_templates/theme.dart';
import 'package:theme_templates/ui_view/widget/app_large_text.dart';

class InvisMenu extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? animation;
  final Function? changePage;
  final String? pageName;

  InvisMenu(
      {Key? key,
      this.animation,
      this.animationController,
      this.changePage,
      this.pageName})
      : super(key: key);

  @override
  State<InvisMenu> createState() => _InvisMenuState();
}

class _InvisMenuState extends State<InvisMenu> {
  String pressedString = "";
  @override
  void initState() {
    setState(() {
      pressedString = "Everything";
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
                        RaisedButton(
                          padding: const EdgeInsets.all(0),
                          color: Colors.transparent,
                          onPressed: () {
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
                                            widget.changePage!(0);
                                            setState(() {
                                              pressedString = "Everything";
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
                                              widget.changePage!(1);
                                            setState(() {
                                              pressedString = "Movies";
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
                                              widget.changePage!(2);
                                            setState(() {
                                              pressedString = "Tv Series";
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
                                              widget.changePage!(3);
                                            setState(() {
                                              pressedString = "Documentary";
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
                                                padding:
                                                    EdgeInsets.only(right: 15),
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
                            children: [
                              Container(
                                padding: const EdgeInsets.only(right: 8),
                                child: AppLargeText(
                                  text: pressedString,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              FaIcon(
                                FontAwesomeIcons.chevronDown,
                                color: Colors.white,
                              )
                            ],
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
