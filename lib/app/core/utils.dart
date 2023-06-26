import 'package:flutter/material.dart';

class Routes {
  static const searchPage = '/searchPage';
  static const loginPage = '/loginPage';
  static const homePage = '/homePage';
}

class AtomColors {
  static const green1 = Color(0xff00880F);
  static const green2 = Color(0xff00880F);

  static const blue1 = Color(0xff0281A0);
  static const blue2 = Color(0xff00AED5);
  static const blue3 = Color(0xff00AED5);

  static const red1 = Color(0xffED2739);
}

class AtomTextStyle {
  static TextStyle get sansLight =>
      const TextStyle(fontFamily: 'Sans', fontWeight: FontWeight.w100);

  static TextStyle get sansMedium =>
      const TextStyle(fontFamily: 'Sans', fontWeight: FontWeight.w400);

  static TextStyle get sansBold =>
      const TextStyle(fontFamily: 'Sans', fontWeight: FontWeight.w500);
}
