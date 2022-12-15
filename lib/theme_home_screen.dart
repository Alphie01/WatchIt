import 'package:theme_templates/bottom_navigation_view/tabIcon_data.dart';
import 'package:theme_templates/screens/collectionScreen/collectionScreen.dart';
import 'package:theme_templates/screens/downloadScreen/downloadScreen.dart';
import 'package:theme_templates/screens/searchScreen/searchScreen.dart';
import 'package:theme_templates/screens/settingsScreen/settings_screen.dart';
import 'package:theme_templates/screens/subpages/infoWatch.dart';
import 'package:theme_templates/screens/subpages/tvInfoWatch.dart';
import 'package:theme_templates/screens/upcomingScreen/upcomingScreen.dart';
import 'package:theme_templates/ui_view/widget/function.dart';
import 'package:flutter/material.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'theme.dart';
import 'screens/mainpage/mainPage.dart';
import 'package:theme_templates/bottom_navigation_view/bottom_bar_view.dart';

import 'ui_view/widget/drawer.dart';

class OnlineTvHomeScreen extends StatefulWidget {
  final int pagecount;
  final String? watchname;
  final List? watchimgs;
  final String? watchdesc;

  const OnlineTvHomeScreen(
      {Key? key,
      this.pagecount = 0,
      this.watchdesc,
      this.watchimgs,
      this.watchname})
      : super(key: key);

  @override
  _OnlineTvHomeScreenState createState() => _OnlineTvHomeScreenState();
}

class _OnlineTvHomeScreenState extends State<OnlineTvHomeScreen>
    with TickerProviderStateMixin {
  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: OnlineTvTheme.background,
  );

  int highPri = 1;

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });

    if (widget.pagecount == 0) {
      animationController = AnimationController(
          duration: const Duration(milliseconds: 600), vsync: this);
      tabBody = OnlineTvMainPage(animationController: animationController);
    } else if (widget.pagecount == 1) {
      animationController = AnimationController(
          duration: const Duration(milliseconds: 600), vsync: this);
      tabBody = OnlineTvInfoPage(
        animationController: animationController,
        watchdesc: widget.watchdesc,
        watchimgs: widget.watchimgs,
        watchname: widget.watchname,
      );
    } else if (widget.pagecount == 2) {
      animationController = AnimationController(
          duration: const Duration(milliseconds: 600), vsync: this);
      tabBody = OnlineSeriesInfoPage(
        animationController: animationController,
        watchdesc: widget.watchdesc,
        watchimgs: widget.watchimgs,
        watchname: widget.watchname,
      );
    } else if (widget.pagecount == 3) {
      animationController = AnimationController(
          duration: const Duration(milliseconds: 600), vsync: this);
      tabBody = SettingsScreen(
        animationController: animationController,
      );
    }
    highPri = 1;

    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: OnlineTvTheme.background,
      child: Scaffold(
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: OnlineTvTheme
                .background, //This will change the drawer background to blue.
            //other styles
          ),
          child: Drawer(
            child: DrawerScreen(),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              changeValue = true;
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = OnlineTvUpcomingPage(
                      animationController: animationController);
                });
              });
            } else if (index == 1) {
              changeValue = true;
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = OnlineTvSearchPage(
                      animationController: animationController);
                });
              });
            } else if (index == 2) {
              changeValue = true;
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = OnlineTvCollectionPage(
                      animationController: animationController);
                });
              });
            } else if (index == 4) {
              changeValue = false;
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = OnlineTvMainPage(
                      animationController: animationController);
                });
              });
            } else if (index == 3) {
              changeValue = true;
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = OnlineTvDownloadPage(
                      animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
