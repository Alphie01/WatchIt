import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:theme_templates/theme.dart';
import 'package:theme_templates/theme_home_screen.dart';

class OnlineTvAppBar extends StatefulWidget {
  final AnimationController? animationController;
  final Animation<double>? topBarAnimation;
  final double topBarOpacity;
  final Function openDrawer;

  const OnlineTvAppBar(
      {Key? key,
      this.animationController,
      required this.openDrawer,
      this.topBarAnimation,
      this.topBarOpacity = 0.0})
      : super(key: key);

  @override
  State<OnlineTvAppBar> createState() => _OnlineTvAppBarState();
}

class _OnlineTvAppBarState extends State<OnlineTvAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: widget.topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - widget.topBarAnimation!.value), 0.0),
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 25),
                  width: double.maxFinite,
                  height: AppBar().preferredSize.height +
                      MediaQuery.of(context).padding.top,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(25)),
                    color: Colors.transparent.withOpacity(widget.topBarOpacity),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: OnlineTvTheme.background
                              .withOpacity(0.4 * widget.topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Visibility(
                    visible: widget.topBarOpacity == 0 ? false : true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: InkWell(
                            onTap: () {
                              widget.openDrawer();
                            },
                            child: FaIcon(
                              FontAwesomeIcons.bars,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: IconButton(
                                onPressed: () {},
                                icon: FaIcon(
                                  FontAwesomeIcons.arrowUpRightFromSquare,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                widget.animationController
                                    ?.reverse()
                                    .then<dynamic>((data) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OnlineTvHomeScreen(
                                                pagecount: 3,
                                              )));
                                });
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/profile.png")),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
