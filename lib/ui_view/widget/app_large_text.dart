import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLargeText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final TextAlign align;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
  final int maxLineCount;
  AppLargeText(
      {Key? key,
      this.size = 30,
      this.maxLineCount = 2,
      this.fontStyle = FontStyle.normal,
      this.fontWeight = FontWeight.normal,
      required this.text,
      this.align = TextAlign.start,
      this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLineCount,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontStyle: fontStyle,
          fontWeight: fontWeight,
          fontFamily: 'SFPRODISPLAY'),
    );
  }
}
