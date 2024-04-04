import 'package:flutter/material.dart';

class AppColor extends ThemeExtension<AppColor> {
  factory AppColor() => _light;

  AppColor._({
    required this.white,
    required this.black,
    required this.blue,
    required this.red,
    required this.gray90,
    required this.gray70,
    required this.gray50,
    required this.gray30,
    required this.gray20,
    required this.gray10,
  });

  static final AppColor _light = AppColor._(
    white: const Color(0xFFFFFFFF),
    black: const Color(0xFF09090B),
    blue: const Color(0xFF314BFA),
    red: const Color(0xFFFF2727),
    gray90: const Color(0xFF333333),
    gray70: const Color(0xFF7D7D7D),
    gray50: const Color(0xFFACACAC),
    gray30: const Color(0xFFD9D9D9),
    gray20: const Color(0xFFF3F3F3),
    gray10: const Color(0xFFF9F9F9),
  );

  final Color white;
  final Color black;
  final Color blue;
  final Color red;
  final Color gray90;
  final Color gray70;
  final Color gray50;
  final Color gray30;
  final Color gray20;
  final Color gray10;

  static late BuildContext _context;
  static void init(BuildContext context) => _context = context;

  static AppColor get of => Theme.of(_context).extension<AppColor>()!;
  static AppColor? get maybeOf => Theme.of(_context).extension<AppColor>();

  @override
  ThemeExtension<AppColor> copyWith({
    Color? white,
    Color? black,
    Color? blue,
    Color? red,
    Color? gray90,
    Color? gray70,
    Color? gray50,
    Color? gray30,
    Color? gray20,
    Color? gray10,
  }) {
    return AppColor._(
      white: white ?? this.white,
      black: black ?? this.black,
      blue: blue ?? this.blue,
      red: red ?? this.red,
      gray90: gray90 ?? this.gray90,
      gray70: gray90 ?? this.gray70,
      gray50: gray50 ?? this.gray50,
      gray30: gray30 ?? this.gray30,
      gray20: gray20 ?? this.gray20,
      gray10: gray10 ?? this.gray10,
    );
  }

  @override
  ThemeExtension<AppColor> lerp(
      covariant ThemeExtension<AppColor>? other,
      double t,
      ) {
    if (other is! AppColor) {
      return this;
    }
    return AppColor._(
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      blue: Color.lerp(black, other.black, t)!,
      red: Color.lerp(red, other.red, t)!,
      gray90: Color.lerp(gray90, other.gray90, t)!,
      gray70: Color.lerp(gray70, other.gray90, t)!,
      gray50: Color.lerp(gray50, other.gray50, t)!,
      gray30: Color.lerp(gray30, other.gray30, t)!,
      gray20: Color.lerp(gray20, other.gray20, t)!,
      gray10: Color.lerp(gray10, other.gray10, t)!,
    );
  }
}