import 'package:e_commerce/core/constants/app_colors.dart';
import 'package:e_commerce/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTheme{
  static final ThemeData lightTheme=ThemeData(
    primaryColor: AppColors.black,
    secondaryHeaderColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.black,
    ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyle.Poppins600w24s.copyWith(color: AppColors.black),
      bodyMedium: AppTextStyle.poppinsW50018s.copyWith(color: AppColors.black),
      bodySmall: AppTextStyle.Poppins300w16s.copyWith(color: AppColors.black),


    ));
  static final ThemeData darkTheme=ThemeData(
    primaryColor: AppColors.white,
    secondaryHeaderColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.black,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
      ),
    textTheme: TextTheme(
      bodyLarge: AppTextStyle.Poppins600w24s,
      bodyMedium: AppTextStyle.poppinsW50018s,
      bodySmall: AppTextStyle.Poppins300w16s,

    ));

}