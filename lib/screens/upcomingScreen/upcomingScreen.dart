import 'package:theme_templates/bottom_navigation_view/contents.dart';
import 'package:theme_templates/ui_view/mainPageWidget/headerthumbnail.dart';
import 'package:theme_templates/ui_view/mainPageWidget/invisMenu.dart';
import 'package:theme_templates/ui_view/mainPageWidget/recentwatced.dart';
import 'package:theme_templates/ui_view/mainPageWidget/rowContent.dart';
import 'package:theme_templates/ui_view/searchScreenWidget/columnInf.dart';
import 'package:theme_templates/ui_view/searchScreenWidget/searchHeader.dart';
import 'package:theme_templates/ui_view/title_view.dart';

import 'package:flutter/material.dart';
import 'package:theme_templates/ui_view/upcomingWidget/upcomingNews.dart';
import 'package:theme_templates/ui_view/widget/appbar.dart';
import 'package:theme_templates/ui_view/widget/drawer.dart';

import '../../theme.dart';

class OnlineTvUpcomingPage extends StatefulWidget {
  const OnlineTvUpcomingPage({Key? key, this.animationController})
      : super(key: key);

  final AnimationController? animationController;
  @override
  _OnlineTvUpcomingPageState createState() => _OnlineTvUpcomingPageState();
}

class _OnlineTvUpcomingPageState extends State<OnlineTvUpcomingPage>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];

  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 0.6;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    const int count = 5;

    listViews.add(
      TitleView(
        titleTxt: 'Top Searched',
        subTxt: "",
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(SizedBox(
      height: 15,
    ));

    listViews.add(
      UpcomingNews(
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    //tab view
    //  https://tr.web.img3.acsta.net/pictures/20/08/28/14/59/2855138.jpg
    //önceki cafeler
    //çeşitler
    //aşşağı doğru sırala
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: OnlineTvTheme.background,
      child: Scaffold(
        drawer: new Drawer(
          child: DrawerScreen(),
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            OnlineTvAppBar(
              openDrawer: () {
                print("object");
                Scaffold.of(context).openDrawer();
              },
              animationController: widget.animationController,
              topBarAnimation: topBarAnimation,
              topBarOpacity: topBarOpacity,
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: OnlineTvTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Container(
                          width: double.maxFinite,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                      size: 22 + 6 - 6 * topBarOpacity,
                                    ),
                                    onPressed: (() {}),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
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
