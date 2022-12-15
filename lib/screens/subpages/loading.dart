import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:theme_templates/theme.dart';

import 'package:theme_templates/theme_home_screen.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateHome();
  }

  _navigateHome() {
    Future.delayed(Duration(seconds: 3), () {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => OnlineTvHomeScreen(
                      pagecount: 0,
                    )));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.maxFinite,
      color: OnlineTvTheme.nearlyDarkBlue.withOpacity(0.4),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/logo-white.png'),
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high)),
            ),
          ),
          CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
