import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
      backgroundColor: Colors.blue,
      // buttonColor: Colors.blue, // accentColor: Colors.red,
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.green,
        disabledColor: Colors.blue,
      ));
  static final dark = ThemeData.dark().copyWith(
    // accentColor: Colors.pink,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      disabledColor: Colors.black,
    ),
    backgroundColor: Colors.black,
    // buttonColor: Colors.red,
  );
}
