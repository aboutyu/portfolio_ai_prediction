import 'package:flutter/material.dart';

class Pretendard {
  // 인스턴스화 방지
  Pretendard._();

  static const String _fontFamily = 'Pretendard';

  // 내부적으로 사용하는 공통 스타일 생성 함수
  static TextStyle _style({
    required FontWeight weight,
    double? size,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontWeight: weight,
      fontSize: size,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // Thin (100)
  static TextStyle thin({double? size, Color? color, double? height}) =>
      _style(weight: FontWeight.w100, size: size, color: color, height: height);

  // ExtraLight (200)
  static TextStyle extraLight({double? size, Color? color, double? height}) =>
      _style(weight: FontWeight.w200, size: size, color: color, height: height);

  // Light (300)
  static TextStyle light({double? size, Color? color, double? height}) =>
      _style(weight: FontWeight.w300, size: size, color: color, height: height);

  // Regular (400)
  static TextStyle regular({double? size, Color? color, double? height}) =>
      _style(weight: FontWeight.w400, size: size, color: color, height: height);

  //  Medium (500)
  static TextStyle medium({double? size, Color? color, double? height}) =>
      _style(weight: FontWeight.w500, size: size, color: color, height: height);

  // SemiBold (600)
  static TextStyle semiBold({double? size, Color? color, double? height}) =>
      _style(weight: FontWeight.w600, size: size, color: color, height: height);

  // Bold (700)
  static TextStyle bold({double? size, Color? color, double? height}) =>
      _style(weight: FontWeight.w700, size: size, color: color, height: height);

  // ExtraBold (800)
  static TextStyle extraBold({double? size, Color? color, double? height}) =>
      _style(weight: FontWeight.w800, size: size, color: color, height: height);

  // Black (900)
  static TextStyle black({double? size, Color? color, double? height}) =>
      _style(weight: FontWeight.w900, size: size, color: color, height: height);
}
