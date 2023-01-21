
import 'package:ariam_handcraft/shared/style/colors.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = const Color(0xff0b3954),
  Color textColor = Colors.white,
  bool isUpperCase = true,
  double fontSize = 18,
  double borderRadius = 20,
  Widget? icon,
  required final Function()? function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: function,
            child: Text(
              isUpperCase ? text.toUpperCase() : text,
              style:  TextStyle(
                fontSize: fontSize,
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child:icon != null ? icon : null,
          )
        ],
      ),
    );