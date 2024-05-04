import 'package:be_friend/common/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData().copyWith(
    scaffoldBackgroundColor: AppColors.primaryBackground,
    primaryColor: AppColors.primaryText,
    appBarTheme: const AppBarTheme().copyWith(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: AppColors.primaryText),
    )
  );
}