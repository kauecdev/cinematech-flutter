import 'package:flutter/material.dart';

class CinematechAppUiConfigs {
  CinematechAppUiConfigs._();

  static String get title => "Cinematech app";

  static ThemeData get theme => ThemeData(
      fontFamily: 'Metropolis',
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Color(0xff222222),
            fontSize: 18,
            fontWeight: FontWeight.w500),
      ));
}
