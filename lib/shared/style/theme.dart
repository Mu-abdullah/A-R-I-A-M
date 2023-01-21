import 'package:ariam_handcraft/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../component/strings.dart';
import '../component/switch_color_to_material.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: black,
  primarySwatch: buildMaterialColor(white),
  fontFamily: demi,
  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey,
          systemNavigationBarIconBrightness: Brightness.light),
      color: Colors.black,
      elevation: 0.0,
      titleTextStyle: TextStyle(
          fontFamily: "demi",
          fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(
        color: Colors.white,
      )),
  textTheme: const TextTheme(
      bodyText1: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
);
ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: white,
  primarySwatch: buildMaterialColor(blueBlack),
  fontFamily: demi,
  appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey,
          systemNavigationBarIconBrightness: Brightness.light),
      color: Colors.white,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontFamily: "demi",
          fontSize: 18, color: Color(0xff0b3954), fontWeight: FontWeight.bold),
      iconTheme: IconThemeData(
        color: Colors.white,
      )),
  textTheme: const TextTheme(
      bodyText1:
          TextStyle(fontWeight: FontWeight.w600, color: Color(0xff0b3954))),
);
