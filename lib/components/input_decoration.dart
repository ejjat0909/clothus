import 'package:clothus/constant.dart';
import 'package:flutter/material.dart';

InputDecoration textFieldInputDecoration(
  String labelText,
  String hintText, {
  Widget? prefixIcon,
  Widget? suffixIcon,
  String? errortext,
}) {
  return InputDecoration(
    //errorMaxLines: isError? 0 : 1,
    suffixIcon: suffixIcon,
    contentPadding: EdgeInsets.symmetric(vertical: 12.5, horizontal: 10),
    isDense: true,
    prefixIcon: prefixIcon,
    hintText: hintText,
    hintStyle: TextStyle(
      color: ColorConstant.primaryColor.withOpacity(0.33),
      fontSize: 13,
    ),
    labelText: labelText,
    labelStyle: TextStyle(
      color: ColorConstant.primaryColor.withOpacity(0.33),
      fontSize: 12,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.auto,
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8.0),
      borderSide:  BorderSide(color: ColorConstant.primaryColor, width: 1.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        width: 1.0,
        color: Colors.red.withOpacity(0.33),
      ),
    ),
    errorBorder: OutlineInputBorder(
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        width: 1.0,
        color: Colors.red.withOpacity(0.33),
      ),
    ),
    enabledBorder: OutlineInputBorder(
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(
        width: 1.0,
        color: Colors.black.withOpacity(0.33),
      ),
    ),
  );
}
