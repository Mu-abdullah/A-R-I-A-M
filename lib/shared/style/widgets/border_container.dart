import 'package:flutter/material.dart';

Widget borderContainer({
  required Widget widget,
  height,
  width,
  double topLeft = 0.0,
  double topRight = 0.0,
  double bottomLeft = 0.0,
  double bottomRight = 0.0,
  Color containerColor = Colors.transparent,
  Color borderColor = Colors.transparent,
  double borderWidth = 1,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
      border: Border.all(color: borderColor,width:borderWidth ),
      color: containerColor,
    ),
    child: widget,
  );
}