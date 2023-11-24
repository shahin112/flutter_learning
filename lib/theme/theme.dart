import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightThem(BuildContext context) => ThemeData(
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          )));

  static ThemeData dartTheme(BuildContext context) => ThemeData(brightness: Brightness.dark);

  //Color
  static Color creamColor=Color(0xfff5f5f5);
  static Color darkBluishColor=Color(0xff403b58);
}
