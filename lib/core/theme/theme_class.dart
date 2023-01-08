import 'package:ecommerce_test/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme{

  static ThemeData lightTheme = ThemeData(

    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.white,
        onPrimary: AppColors.black,
        secondary: AppColors.purple,
        onSecondary: Colors.white,
        error: Colors.redAccent,
        onError: Colors.white,
        background: AppColors.white,
        onBackground: AppColors.black,
        surface: Colors.white,
        onSurface: Colors.white
    ),

    textTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.black,
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      headline2: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      headline3: TextStyle(
        color: AppColors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyText1: TextStyle(
        color: AppColors.black,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      button: TextStyle(
        color: AppColors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      )

    ),

  );

  static ThemeData darkTheme = ThemeData(



  );

}