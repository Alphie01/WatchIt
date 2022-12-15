import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final TextAlign align;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final int maxLineCount;

  AppText(
      {Key? key,
      this.size = 16,
      this.maxLineCount = 5,
      required this.text,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.align = TextAlign.start,
      this.color = Colors.black54})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLineCount,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight, fontStyle: fontStyle, fontFamily: 'SFPRODISPLAY'),
    );
  }
}
