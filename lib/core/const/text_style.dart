import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static TextStyle pretendard(double size, double? height) => TextStyle(
        fontFamily: 'Pretendard',
        leadingDistribution: TextLeadingDistribution.even,
        fontSize: size,
        height: height == null ? null : height / size,
      );

  static TextStyle pretendardRegular(double size, double? height) =>
      pretendard(size, height).copyWith(
        fontWeight: FontWeight.w400,
      );

  static TextStyle pretendardMedium(double size, double? height) =>
      pretendard(size, height).copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle pretendardSemiBold(double size, double? height) =>
      pretendard(size, height).copyWith(
        fontWeight: FontWeight.w600,
      );

  static TextStyle pretendardBold(double size, double? height) =>
      pretendard(size, height).copyWith(
        fontWeight: FontWeight.w800,
      );

  static final TextStyle headlineBold1 = pretendardSemiBold(22, 29);
  static final TextStyle headlineBold2 = pretendardSemiBold(20, 24);

  static final TextStyle headlineMedium1 = pretendardMedium(22, 29);
  static final TextStyle headlineMedium2 = pretendardMedium(20, 24);

  static final TextStyle headlineRegular1 = pretendardRegular(22, 29);
  static final TextStyle headlineRegular2 = pretendardRegular(20, 24);

  static final TextStyle bodyBold1 = pretendardSemiBold(16, 19);
  static final TextStyle bodyBold2 = pretendardSemiBold(14, 17);
  static final TextStyle bodyBold3 = pretendardSemiBold(12, 14);



  static final TextStyle bodyRegular1 = pretendardRegular(16, 19);
  static final TextStyle bodyRegular2 = pretendardRegular(14, 17);
  static final TextStyle bodyRegular3 = pretendardRegular(12, 14);
}
