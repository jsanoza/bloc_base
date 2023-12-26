import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextThemes {
  const AppTextThemes._();

  static const fontFamily = 'AdelleSans';

  static TextTheme defaultStyle = const TextTheme(
    // headline1
    displayLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w900,
      fontSize: 57,
      letterSpacing: -0.25,
      color: AppColors.black,
    ),
    // headline2
    displayMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 34,
      letterSpacing: .5,
      color: AppColors.black,
    ),
    // headline3
    displaySmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 28,
      letterSpacing: .5,
      color: AppColors.black,
    ),
    // headline4
    headlineMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 24,
      letterSpacing: 0.5,
      color: AppColors.black,
    ),
    // headline5
    headlineSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 20,
      letterSpacing: 0.25,
      color: AppColors.black,
    ),
    // headline6
    titleLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 18,
      letterSpacing: 0.25,
      color: AppColors.black,
    ),
    // bodyText1
    bodyLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0.5,
      color: AppColors.black,
    ),
    // bodyText2
    bodyMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0.25,
      color: AppColors.black,
    ),
    labelLarge: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 16,
      letterSpacing: .25,
      color: AppColors.black,
    ),
    labelMedium: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: .25,
      color: AppColors.black,
    ),
    labelSmall: TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: .25,
      color: AppColors.black,
    ),
  );

  static TextTheme darkStyle = TextTheme(
    // headline1
    displayLarge: defaultStyle.displayLarge!.copyWith(color: AppColors.white),
    // headline2
    displayMedium: defaultStyle.displayMedium!.copyWith(color: AppColors.white),
    // headline3
    displaySmall: defaultStyle.displaySmall!.copyWith(color: AppColors.white),
    // headline4
    headlineMedium:
        defaultStyle.headlineMedium!.copyWith(color: AppColors.white),
    // headline5
    headlineSmall: defaultStyle.headlineSmall!.copyWith(color: AppColors.white),
    // headline6
    titleLarge: defaultStyle.titleLarge!.copyWith(color: AppColors.white),
    // bodyText1
    bodyLarge: defaultStyle.bodyLarge!.copyWith(color: AppColors.white),
    // bodyText2
    bodyMedium: defaultStyle.bodyMedium!.copyWith(color: AppColors.white),
    labelLarge: defaultStyle.labelLarge!.copyWith(color: AppColors.white),
    labelMedium: defaultStyle.labelMedium!.copyWith(color: AppColors.white),
    labelSmall: defaultStyle.labelSmall!.copyWith(color: AppColors.white),
  );
}
