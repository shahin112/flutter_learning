import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightThem() => ThemeData(
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
          )));

  static ThemeData dartTheme() => ThemeData(brightness: Brightness.dark);
}
