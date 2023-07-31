import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightMode = ThemeData(
  primarySwatch: defaultColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: kGold1Color,
    foregroundColor: Colors.white,

  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    centerTitle: true,
    // systemOverlayStyle: SystemUiOverlayStyle(
    //   statusBarColor: kWhiteColor,
    //   statusBarIconBrightness: Brightness.light,
    // ),
    backgroundColor: kDarkBlue2Color,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      fontFamily: 'Nunito'
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.shifting,
    elevation: 50.0,
    selectedItemColor: kGold1Color,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  fontFamily: 'Nunito',
);
ThemeData darkMode = ThemeData(
  primarySwatch: defaultColor,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: defaultColor,
  ),
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('333739'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 30.0,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    backgroundColor: HexColor('333739'),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  fontFamily: 'Nunito',
);