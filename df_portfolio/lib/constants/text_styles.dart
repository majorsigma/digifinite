import 'package:df_portfolio/constants/fonts.dart';
import 'package:flutter/material.dart';


class TextStyles {
  TextStyles._();

  static TextStyle get logo => const TextStyle(
        fontFamily: Fonts.product,
        color: Color(0xFF45405B),
        fontSize: 22.0, //22.0
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      );

  static TextStyle get menuItem => const TextStyle(
        fontFamily: Fonts.product,
        fontSize: 12.0, //12,.0
        letterSpacing: 1.0,
        color: Color(0xFF45405B),
      );

  static TextStyle get heading => const TextStyle(
        fontFamily: Fonts.nexaBold,
        color: Color(0xFF45405B),
        fontSize: 45.0, //45.0
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
      );

  static TextStyle get subHeading => const TextStyle(
        color: Color(0xFF45405B),
        fontFamily: Fonts.product,
        fontSize: 17.0, //17.0
        letterSpacing: 1.2,
      );

  static TextStyle get company => const TextStyle(
    fontFamily: Fonts.product,
    color: Color(0xFF45405B),
    height: 1.5,
    fontSize: 15.0, //15.0
    letterSpacing: 1.0,
  );

  static TextStyle get body => const TextStyle(
        fontFamily: Fonts.product,
        color: Color(0xFF85819C),
        height: 1.5,
        fontSize: 12.0, //12.0
        letterSpacing: 1.0,
      );

  static TextStyle get body1 => const TextStyle(
    fontFamily: Fonts.product,
    color: Color(0xFF85819C),
    height: 1.5,
    fontSize: 10.0, //10.0
    letterSpacing: 1.0,
  );

  static TextStyle get chip => const TextStyle(
    fontFamily: Fonts.product,
    color: Color(0xFF85819C),
    height: 1.5,
    fontSize: 12.0, //12.0
    letterSpacing: 1.0,
  );
}
