import 'package:theme_templates/theme_home_screen.dart';
import 'package:theme_templates/ui_view/settingsWidget/settings_app.dart';
import 'package:theme_templates/ui_view/settingsWidget/settings_gizlilik.dart';
import 'package:theme_templates/ui_view/settingsWidget/settings_person.dart';
import 'package:theme_templates/ui_view/settingsWidget/settings_personal.dart';
import 'package:theme_templates/ui_view/title_view.dart';
import 'package:flutter/material.dart';

import 'package:theme_templates/theme.dart';

class SettingsInfo extends StatefulWidget {
  const SettingsInfo({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _SettingsInfoState createState() => _SettingsInfoState();
}

class _SettingsInfoState extends State<SettingsInfo>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;
  AnimationController? animationController;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

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
            topBarOpacity = 1.0;
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

    listViews.add(HeaderSetting(
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: widget.animationController!,
    ));

    listViews.add(
      TitleView(
        titleTxt: 'Personal Settings',
        subTxt: 'More',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(settingsApp(
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: widget.animationController!,
    ));

    listViews.add(
      TitleView(
        titleTxt: 'Application Settings',
        subTxt: 'More',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(settingsPersonal(
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: widget.animationController!,
    ));

    listViews.add(
      TitleView(
        titleTxt: 'Privacy Settings',
        subTxt: 'More',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController!,
      ),
    );

    listViews.add(settingsGizlilik(
      animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: widget.animationController!,
          curve: Interval((1 / count) * 2, 1.0, curve: Curves.fastOutSlowIn))),
      animationController: widget.animationController!,
    ));

    listViews.add(
      TitleView(
        titleTxt: 'Support',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController!,
            curve:
                Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn))),
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
            getMainListViewUI(),
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
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
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
