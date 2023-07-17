import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import '../colors.dart';

ThemeData darktheme = ThemeData(
    fontFamily: 'jannah',
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      labelStyle: TextStyle(
        color: Colors.grey,
      ),
      hintStyle: TextStyle(
        color: Colors.grey,
      ),
    ),
    unselectedWidgetColor: Colors.white,
    dialogTheme:DialogTheme(


        backgroundColor: Colors.black,contentTextStyle:TextStyle(

        fontSize: 18.0,color: Colors.white,
        fontWeight: FontWeight.bold)) ,
    primarySwatch:defaultColor,
    bottomNavigationBarTheme:  BottomNavigationBarThemeData(
        backgroundColor:HexColor('333739'),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultColor,
elevation: 20.0,
        unselectedItemColor: Colors.grey),
    appBarTheme:  AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:HexColor('333739'),
titleSpacing: 20.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light),
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold)),
    scaffoldBackgroundColor:HexColor('333739'),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
      subtitle1: TextStyle(color: Colors.white),
    ),iconTheme:IconThemeData(color: Colors.white,size: 30) );
ThemeData lighttheme = ThemeData(
    unselectedWidgetColor:Colors.grey,
    dialogTheme:DialogTheme(


        backgroundColor:Colors.white,contentTextStyle:TextStyle(
        decorationColor:Colors.black ,
        fontSize: 18.0,color: Colors.black,
        fontWeight: FontWeight.bold)) ,
    fontFamily: 'jannah',
    iconTheme:IconThemeData(color: Colors.black,size: 30),
    primarySwatch: defaultColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: defaultColor),
    appBarTheme: const AppBarTheme(
      titleSpacing: 20.0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor:Colors.white,
            statusBarIconBrightness: Brightness.dark),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold)),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black)));