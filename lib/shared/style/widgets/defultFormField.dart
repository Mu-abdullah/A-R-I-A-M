

import 'package:flutter/material.dart';

import '../colors.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required IconData prefix,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function(String?)? onSaved,
  FormFieldValidator? validate,
  Widget? suffix,
  String? label,
  String? hint,
  int maxLines = 1,
  bool isPassword = false,
}) =>
    TextFormField(

      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      obscureText: isPassword,
      controller: controller,
      keyboardType: type,
      maxLines: maxLines,
      onSaved: onSaved,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:  BorderSide(color: blueBlack, width: 2.0),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );