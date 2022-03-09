import 'package:flutter/material.dart';
import 'package:shop_app/src/pakages/hexColor.dart';

InputDecoration userDecoration({required String hintText}) {
  return InputDecoration(
    hintStyle: TextStyle(fontSize: 12),
    hintText: hintText,
    filled: true,
    fillColor: hexToColor('#F1F7FC'),
    border: InputBorder.none,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
    ),
    errorStyle: TextStyle(color: Colors.red),
  );
}
