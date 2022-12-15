import 'package:theme_templates/bottom_navigation_view/contents.dart';
import 'package:theme_templates/ui_view/mainPageWidget/recentwatced.dart';
import 'package:theme_templates/ui_view/settingsWidget/lastComments.dart';
import 'package:theme_templates/ui_view/settingsWidget/settings_infos.dart';
import 'package:theme_templates/ui_view/settingsWidget/settings_person.dart';
import 'package:theme_templates/ui_view/title_view.dart';
import 'package:theme_templates/ui_view/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:theme_templates/theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;
  AnimationController? animationController;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;
  bool settingsPage = false;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
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
    List comment = [
      {
        'name': 'John Doe',
        'imgs':
            "assets/profile.png",
        'comments':
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. Qui, tempore.'
      },
      {
        'name': 'John Doe',
        'imgs':
            "assets/profile.png",
        'comments': 'Lorem ipsum dolor sit.'
      },
      {
        'name': 'John Doe',
        'imgs':
            "assets/profile.png",
        'comments':
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Veritatis sunt optio fuga necessitatibus placeat repellat atque cum temporibus? Adipisci non exercitationem unde praesentium repellendus voluptatum?'
      }
    ];

    listViews.add(HeaderSetting(
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: widget.animationController!,
    ));

    if (settingsPage == false) {
      listViews.add(SizedBox(
        height: 10,
      ));
    } else {
      listViews.add(SizedBox(
        height: 50,
      ));
    }

    listViews.add(
      TitleView(
        titleTxt: 'Last Watched',
        subTxt: "",
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );
    listViews.add(SizedBox(
      height: 5,
    ));

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
    listViews.add(SizedBox(
      height: 5,
    ));
    listViews.add(
      TitleView(
        titleTxt: 'Last Comments',
        subTxt: "",
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );
    listViews.add(
      LastComments(
        newsCommentsList: comment,
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );
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
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            settingsPage
                ? SettingsInfo(
                    animationController: widget.animationController,
                  )
                : getMainListViewUI(),
            OnlineTvAppBar(
              openDrawer: () {
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
}
