import 'package:flutter/material.dart';

class Themes{
  static final Color _primaryColor = Colors.purpleAccent;
  static final String _fontFamily = 'Dogica';

  static ThemeData get lightTheme{
    return ThemeData(
      textTheme: _textTheme,
      // fontFamily: 'Dogica',
      cardTheme: _cardTheme,
      primaryColor: _primaryColor,
    );
  }

  static get _textTheme => TextTheme(
    headline1: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Colors.black),
    headline2: TextStyle(fontSize: 12, color: Colors.blue),
    bodyText1: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, color: Colors.black),
    bodyText2: TextStyle(fontSize: 12, color: Color.fromRGBO(0, 0, 0, 0.5))
  );
  static get _cardTheme => CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20)
    )
  );
}