import 'package:flutter/material.dart';

class Routes {
  static const searchPage = '/searchPage';
}

class AtomColors {
  static const primaryColor = Color(0xff00AA13);
}

class AtomTextStyle {
  static TextStyle get sansLight =>
      const TextStyle(fontFamily: 'Sans', fontWeight: FontWeight.w100);

  static TextStyle get sansMedium =>
      const TextStyle(fontFamily: 'Sans', fontWeight: FontWeight.w400);

  static TextStyle get sansBold =>
      const TextStyle(fontFamily: 'Sans', fontWeight: FontWeight.w700);
}
