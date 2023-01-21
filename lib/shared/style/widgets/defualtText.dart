import 'package:flutter/material.dart';

Widget appText({
  required String text,
  double size = 24,
  Color color = const Color(0xff0b3954),
  String fontFamily = "demi",
  FontWeight fontWeight = FontWeight.bold,
  TextOverflow overflow = TextOverflow.ellipsis,
  int maxLine = 1 ,
  bool needLine = false,
}) {
  return Text(

    text,
    maxLines: maxLine,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
      fontFamily: fontFamily,
      overflow: overflow,
        decoration:needLine == true ? TextDecoration.lineThrough : TextDecoration.none
    ),
  );
}