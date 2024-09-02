import 'package:ecommerce_application/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: "PlusJakartaSans",
    brightness: Brightness.light,
    scaffoldBackgroundColor: BAppColors.whiteColor,
    appBarTheme: const AppBarTheme(backgroundColor: BAppColors.whiteColor),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: BAppColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: BAppColors.blackColor,
      unselectedItemColor: BAppColors.grey150Color,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    fontFamily: "PlusJakartaSans",
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(backgroundColor: BAppColors.blackColor),
    scaffoldBackgroundColor: BAppColors.blackColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: BAppColors.blackColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: BAppColors.whiteColor,
      unselectedItemColor: BAppColors.grey150Color,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
    ),
  );
}
