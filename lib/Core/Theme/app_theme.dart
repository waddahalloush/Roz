import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: const Color(0xFF845EB5),
      primaryColorLight: const Color(0xFFDD3663),
      primaryColorDark: Colors.black87,
      drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      primaryTextTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: Color(0xFF33196B)), //heading screens text
        headline2: TextStyle(
            fontSize: 15,
            color: Colors.indigo,
            fontWeight: FontWeight.w900), // User Name text
        headline3: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400), // Gifts text
        headline4: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ), //login with email & Button text
        headline5: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold), // Button text
        headline6: TextStyle(
            color: Color(0xFFDD3663),
            fontSize: 14,
            fontWeight: FontWeight.w900), //play video & skip Text
        subtitle1: TextStyle(
            fontSize: 12,
            color: Color(0xFF33196B),
            fontWeight: FontWeight.bold), //screens Details text
        subtitle2:
            TextStyle(fontSize: 11, color: Color(0xFFDD3663)), // terms subtitle
        bodyText1: TextStyle(
            fontSize: 18,
            color: Color(0xFF33196B),
            fontWeight: FontWeight.w600), //wanna know Text
        bodyText2: TextStyle(
            fontSize: 10,
            color: Color(0xFF33196B),
            fontWeight: FontWeight.bold), // play video subtitle
        caption: TextStyle(
          fontSize: 10,
          color: Color.fromARGB(255, 67, 66, 66),
        ), //create account text
        overline: TextStyle(
            color: Color(0xFF845EB5),
            fontSize: 10,
            fontWeight: FontWeight.bold), //like intrests text
      ),
      scaffoldBackgroundColor: const Color(0xFFEEFCFF),
      dividerColor: Colors.indigo,
      iconTheme: const IconThemeData(color: Colors.indigo),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ));

  static ThemeData darkTheme = ThemeData(
      primaryColor: Colors.amber,
      primaryColorLight: Colors.deepOrange,
      primaryColorDark: Colors.white70,
      drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.black,
      ),
      primaryTextTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: Colors.white), //heading screens text
        headline2: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w900), // User Name text
        headline3: TextStyle(
            fontSize: 16,
            color: Color(0xFF33196B),
            fontWeight: FontWeight.w400), // Gifts text
        headline4: TextStyle(
          color: Colors.white,
          fontSize: 15,
        ), //login with email & Button text
        headline5: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold), // Button text
        headline6: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w900), //play video & skip Text
        subtitle1: TextStyle(
            fontSize: 12, color: Colors.white), //screens Details terms text
        subtitle2:
            TextStyle(fontSize: 11, color: Colors.redAccent), // terms subtitle
        bodyText1: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 206, 211, 213),
            fontWeight: FontWeight.w600), //wanna know Text
        bodyText2: TextStyle(
            fontSize: 10,
            color: Colors.white,
            fontWeight: FontWeight.bold), // play video subtitle
        caption: TextStyle(
          fontSize: 10,
          color: Color.fromARGB(196, 250, 247, 247),
        ), //create account text
        overline: TextStyle(
            color: Colors.amber,
            fontSize: 10,
            fontWeight: FontWeight.bold), //like intrests text
      ),
      scaffoldBackgroundColor: const Color.fromARGB(209, 17, 9, 35),
      dividerColor: Colors.amber,
      iconTheme: const IconThemeData(color: Colors.white),
      inputDecorationTheme:
          const InputDecorationTheme(border: InputBorder.none));
}
