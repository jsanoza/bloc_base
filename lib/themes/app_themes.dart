import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'text_themes.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: AppColors.kBackgroundColor,
    disabledColor: AppColors.kDisabledButtonColor,
    textTheme: AppTextThemes.defaultStyle,
    appBarTheme: const AppBarTheme(
      color: AppColors.kPrimaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.kButtonColor),
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: AppColors.kButtonTextColor),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(color: AppColors.kButtonTextColor),
        ),
      ),
    ),
  );

  // You can add more themes (dark, etc.) as needed.
}
