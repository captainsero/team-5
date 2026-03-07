import 'package:flutter/material.dart';
import '../constants/color_manager.dart';
import '../constants/font_manager.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.white,

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.grey,
      onSecondary: AppColors.white,
      error: AppColors.error,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.black,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: AppColors.black,
        fontSize: FontSize.s36,
        fontWeight: FontWeightManager.medium,
        fontFamily: FontConstants.interFamily,
      ),
      headlineMedium: TextStyle(
        color: AppColors.black,
        fontSize: FontSize.s30,
        fontWeight: FontWeightManager.medium,
        fontFamily: FontConstants.interFamily,
      ),
      bodyLarge: TextStyle(
        color: AppColors.black,
        fontSize: FontSize.s25,
        fontWeight: FontWeightManager.regular,
        fontFamily: FontConstants.interFamily,
      ),
      bodyMedium: TextStyle(
        color: AppColors.grey,
        fontSize: FontSize.s20,
        fontWeight: FontWeightManager.regular,
        fontFamily: FontConstants.interFamily,
      ),
      bodySmall: TextStyle(
        color: AppColors.placeholder,
        fontSize: FontSize.s16,
        fontWeight: FontWeightManager.regular,
        fontFamily: FontConstants.interFamily,
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: FontSize.s18,
        fontFamily: FontConstants.interFamily,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        textStyle: TextStyle(

          fontSize: FontSize.s16,
          fontWeight: FontWeightManager.medium,
          fontFamily: FontConstants.interFamily,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightBlue,
      hintStyle: TextStyle(
        color: AppColors.placeholder,
        fontSize: FontSize.s16,
        fontFamily: FontConstants.interFamily,
      ),
      labelStyle: TextStyle(
        color: AppColors.grey,
        fontSize: FontSize.s18,
        fontWeight: FontWeight.w500,
        fontFamily: FontConstants.interFamily,
      ),
      floatingLabelStyle: TextStyle(
        color: AppColors.grey,
        fontSize: FontSize.s18,
        fontWeight: FontWeight.w400,
        fontFamily: FontConstants.interFamily,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      errorStyle: TextStyle(
        color: AppColors.error,
        fontSize: FontSize.s12,
        fontFamily: FontConstants.interFamily,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.grey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),

      contentPadding: const EdgeInsets.all(16),
    ),
  );
}
