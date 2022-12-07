// ignore_for_file: unnecessary_const, prefer_const_constructors, unused_local_variable
import 'package:flutter/material.dart';

const colorPrimary = Color.fromARGB(255, 96, 63, 195);
const colorSecondary = Color.fromARGB(255, 251, 241, 131);
const colorSuccess = Color.fromRGBO(39, 174, 96, 1);
const colorError = Color.fromRGBO(255, 63, 52, 1);
const colorGrey = Color.fromRGBO(0, 0, 0, 0.64);
const colorDisable = Color.fromRGBO(192, 192, 192, 0.40);
const colorBlack = Color.fromRGBO(0, 0, 0, 0.881);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorShadow = Color.fromRGBO(0, 0, 0, 0.16);

final appThemePrimary = ThemeData(
    disabledColor: colorDisable,
    bottomAppBarTheme: BottomAppBarTheme(color: colorPrimary),
    fontFamily: "Roboto",
    primaryColor: colorPrimary,
    scaffoldBackgroundColor: Colors.white,
    errorColor: colorError,
    appBarTheme: const AppBarTheme(backgroundColor: colorPrimary),
    textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.normal,
            letterSpacing: -1.5,
            color: colorBlack),
        headline2: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.normal,
            letterSpacing: -0.5,
            color: colorBlack),
        headline3: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.normal,
            letterSpacing: -0.5,
            color: colorBlack),
        headline4: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.25,
            color: colorBlack),
        headline5: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            letterSpacing: -0.5,
            color: colorBlack),
        headline6: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.15,
            color: colorBlack),
        subtitle1: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.15,
            color: colorBlack),
        subtitle2: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.1,
            color: colorBlack),
        bodyText1: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.5,
            color: colorBlack),
        bodyText2: TextStyle(
            fontSize: 8,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.25,
            color: colorBlack),
        button: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            letterSpacing: 1.25,
            color: colorBlack),
        caption: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            letterSpacing: 0.4,
            color: colorBlack),
        overline: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          letterSpacing: 1.5,
          color: colorBlack,
        )));
