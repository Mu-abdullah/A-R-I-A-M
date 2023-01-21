import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar(context,
    {required String contentText, required int seconds}) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    behavior: SnackBarBehavior.floating,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    content: Text(contentText),
    duration: Duration(seconds: seconds),
  ));
}
