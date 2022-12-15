import 'package:theme_templates/bottom_navigation_view/contents.dart';
import 'package:theme_templates/ui_view/mainPageWidget/headerthumbnail.dart';
import 'package:theme_templates/ui_view/mainPageWidget/invisMenu.dart';
import 'package:theme_templates/ui_view/mainPageWidget/recentwatced.dart';
import 'package:theme_templates/ui_view/mainPageWidget/rowContent.dart';
import 'package:theme_templates/ui_view/title_view.dart';

import 'package:flutter/material.dart';
import 'package:theme_templates/ui_view/widget/appbar.dart';
import 'package:theme_templates/ui_view/widget/drawer.dart';

import '../../theme.dart';

class OnlineTvMainPage extends StatefulWidget {
  const OnlineTvMainPage({Key? key, this.animationController})
      : super(key: key);

  final AnimationController? animationController;
  @override
  _OnlineTvMainPageState createState() => _OnlineTvMainPageState();
}

class _OnlineTvMainPageState extends State<OnlineTvMainPage>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  List<Widget> denemeViews = <Widget>[];
  bool changeVal = true;
  String pagename = "Everything";

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
        if (topBarOpacity != 0.6) {
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
      HeaderThumbnailWidget(
        imgAsset:
            "https://tr.web.img3.acsta.net/pictures/20/08/28/14/59/2855138.jpg",
        logoAsset: "assets/tenet-cutout.png",
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(SizedBox(
      height: 15,
    ));
    listViews.add(
      InvisMenu(
        pageName: pagename,
        changePage: (int pageIndex) {
          if (pageIndex == 0 || pageIndex == 1) {
            widget.animationController?.reverse().then<dynamic>((data) {
              if (!mounted) {
                return;
              }
              setState(() {
                changeVal = true;
              });
            });
          } else {
            widget.animationController?.reverse().then<dynamic>((data) {
              if (!mounted) {
                return;
              }
              setState(() {
                changeVal = false;
              });
            });
          }
        },
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Recommended For You',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      RowContent(
        newsImg: movies[0],
        pagecount: 1,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Keep Watching',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      RecentWatched(
        newsImg: movies[4],
        pagecount: 1,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Marvel Movies',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      RowContent(
        newsImg: movies[1],
        pagecount: 1,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'DC Movies',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      RowContent(
        newsImg: movies[2],
        pagecount: 1,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Action Movies',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      RowContent(
        newsImg: movies[3],
        pagecount: 1,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Sci-Fi Movies',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      RowContent(
        newsImg: movies[4],
        pagecount: 1,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: 'Animation Movies',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(
      RowContent(
        newsImg: movies[5],
        pagecount: 1,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      HeaderThumbnailWidget(
        imgAsset:
            "https://resizing.flixster.com/LumPRA7tw5a4VtKzSnGnTWpW2Q8=/ems.cHJkLWVtcy1hc3NldHMvdHZzZXJpZXMvNTlmOGIyM2ItMzRhMy00MjdkLThkNDYtZWJkZDI1ODMzNmI3LmpwZw==",
        logoAsset: "assets/wenday.png",
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    denemeViews.add(SizedBox(
      height: 15,
    ));
    denemeViews.add(
      InvisMenu(
        pageName: pagename,
        changePage: (int pageIndex) {
          if (pageIndex == 0 || pageIndex == 1) {
            widget.animationController?.reverse().then<dynamic>((data) {
              if (!mounted) {
                return;
              }
              setState(() {
                changeVal = true;
              });
            });
          } else {
            widget.animationController?.reverse().then<dynamic>((data) {
              if (!mounted) {
                return;
              }
              setState(() {
                changeVal = false;
              });
            });
          }
        },
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      TitleView(
        titleTxt: 'Recommended For You',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      RowContent(
        newsImg: tvSeries[0],
        pagecount: 2,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      TitleView(
        titleTxt: 'Keep Watching',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      RecentWatched(
        newsImg: tvSeries[4],
        pagecount: 2,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      TitleView(
        titleTxt: 'Action tvSeries',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      RowContent(
        newsImg: tvSeries[1],
        pagecount: 2,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      TitleView(
        titleTxt: 'DC tvSeries',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      RowContent(
        newsImg: tvSeries[2],
        pagecount: 2,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      TitleView(
        titleTxt: 'Fantasy tvSeries',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      RowContent(
        newsImg: tvSeries[3],
        pagecount: 2,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      TitleView(
        titleTxt: 'Sitcom tvSeries',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      RowContent(
        newsImg: tvSeries[4],
        pagecount: 2,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      TitleView(
        titleTxt: 'Thriller Tv Series',
        subTxt: '',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    denemeViews.add(
      RowContent(
        newsImg: tvSeries[5],
        pagecount: 2,
        mainScreenAnimation: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
                parent: widget.animationController!,
                curve: Interval((1 / count) * 2, 1.0,
                    curve: Curves.fastOutSlowIn))),
        mainScreenAnimationController: widget.animationController!,
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
                            openDrawer: (){
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
              top: 0,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: changeVal ? listViews.length : denemeViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return changeVal ? listViews[index] : denemeViews[index];
            },
          );
        }
      },
    );
  }


}
