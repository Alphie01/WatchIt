import 'package:theme_templates/theme.dart';
import 'package:flutter/material.dart';

class TitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const TitleView(
      {Key? key,
      this.titleTxt: "",
      this.subTxt: "",
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.black12, width: 1))),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        titleTxt,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'SFPRODISPLAY',
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          letterSpacing: 0.5,
                          color: Color.fromARGB(255, 160, 176, 184),
                        ),
                      ),
                    ),
                    InkWell(
                        highlightColor: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        onTap: () {},
                        child: subTxt != ''
                            ? Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      subTxt,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        fontFamily: 'SFPRODISPLAY',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                        letterSpacing: 0.5,
                                        color: OnlineTvTheme.nearlyDarkBlue,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 38,
                                      width: 26,
                                      child: Icon(
                                        Icons.arrow_forward,
                                        color: OnlineTvTheme.darkText,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container())
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
