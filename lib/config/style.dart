import 'package:flutter/material.dart';

/////////////////////// colors ////////////////////////////////
class Style {
  static const KPrimaryColorLightMode = Color(0xff1E2125);
  static const KAccentColorLightMode = Color(0xff2A2E36);

  static const white = Colors.white;
  static const inputColor = Colors.white;
  static const actionColor = Color(0xffC7A780);
  static const green = Color(0xff80C7B7);

  static customTheme() {
    return ThemeData(
      primaryColor: KPrimaryColorLightMode,
      accentColor: KAccentColorLightMode,
      errorColor: Colors.red,
      scaffoldBackgroundColor: KAccentColorLightMode,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: TextTheme(
        headline: TextStyle(
          fontSize: 22.0,
          height: 1.2,
        ),
        //app bar title
        display1: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        //funded product title
        display2: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
        display3: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        subtitle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 23,
          height: 1.2,
        ),
        //product details screen title
        display4: TextStyle(
          fontSize: 19.0,
          height: 1.2,
          fontWeight: FontWeight.w300,
        ),
        subhead: TextStyle(
          fontSize: 16.5,
          fontWeight: FontWeight.w400,
          height: 1.2,
        ),
        title: TextStyle(
          fontSize: 17.0,
          height: 1.2,
          fontWeight: FontWeight.w600,
        ),
        //product title
        body1: TextStyle(
          fontSize: 15.0,
          height: 1.2,
        ),
        // old price
        body2: TextStyle(
          fontSize: 16.0,
          height: 1.2,
        ),
        //price
        caption: TextStyle(
          fontSize: 12.0,
          height: 1.2,
        ),
      ),
    );
  }
}
