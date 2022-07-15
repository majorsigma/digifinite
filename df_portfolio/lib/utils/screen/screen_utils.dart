/*
 * Updated by olalekan on 2022/07/15.
 * email: olalekan.o.ogundele@gmail.com
 */

import 'package:flutter/material.dart';

class ScreenUtil {
  static ScreenUtil instance = ScreenUtil();

  double? width;
  double? height;
  bool? allowFontScaling;

  static MediaQueryData? _mediaQueryData;
  static double? _screenWidth;
  static double? _screenHeight;
  static double? _pixelRatio;
  static double? _statusBarHeight;
  static double? _bottomBarHeight;
  static double? _textScaleFactor;

  ScreenUtil({
    this.width = 1080,
    this.height = 1920,
    this.allowFontScaling = false,
  });

  /// returns an instance of ScreenUtil
  static ScreenUtil getInstance() {
    return instance;
  }

  /// initialized the screen utility properties through MediaQuery
  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _mediaQueryData = mediaQuery;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = _mediaQueryData!.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  /// returns MediaQueryData instance
  static MediaQueryData get mediaQueryData => _mediaQueryData!;

  /// returns the TextScaleFactory value
  static double? get textScaleFactory => _textScaleFactor;

  /// returns the pixel ration
  static double? get pixelRatio => _pixelRatio;

  /// returns the screen's widthDp
  static double? get screenWidthDp => _screenWidth;

  /// returns the screen's heightDp
  static double? get screenHeightDp => _screenHeight;

  /// returns the screen's width in dp
  static double? get screenWidth => _screenWidth! * _pixelRatio!;

  /// returns the screen's height in dp
  static double? get screenHeight => _screenHeight! * _pixelRatio!;

  /// returns the status bar's height
  static double? get statusBarHeight => _statusBarHeight;

  /// returns the bottom bar's height
  static double? get bottomBarHeight => _bottomBarHeight;

  /// returns the scaling width
  get scaleWidth => _screenWidth! / instance.width!;

  /// returns the scalling height
  get scaleHeight => _screenHeight! / instance.height!;

  /// sets the width of Screen Utils
  setWidth(double width) => width * scaleWidth;

  /// sets the height of Screen Utils
  setHeight(double height) => height * scaleHeight;

  /// sets the scale-independent pixel of Screen Utils
  setSp(double fontSize) => allowFontScaling!
      ? setWidth(fontSize)
      : setWidth(fontSize) / _textScaleFactor;
}
