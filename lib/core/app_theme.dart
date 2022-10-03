import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppColorScheme {
  final Color appBarColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;

  const AppColorScheme({
    required this.appBarColor,
    required this.activeColor,
    required this.inactiveColor,
    required this.backgroundColor,
  });
}

class AppTheme {
  static const _lightColors = AppColorScheme(
    appBarColor: Color.fromRGBO(29, 29, 39, 1),
    backgroundColor: Colors.white,
    activeColor: Color.fromRGBO(253, 130, 62, 1),
    inactiveColor: Color.fromRGBO(194, 194, 197, 1),
  );

  static AppColorScheme get colors => _lightColors;

  static ThemeData get theme {
    return ThemeData(
      fontFamily: 'Roboto',
      colorScheme: ColorScheme.light(primary: colors.activeColor),
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w700,
        ),
        backgroundColor: colors.appBarColor,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        selectedItemColor: colors.activeColor,
        unselectedItemColor: colors.inactiveColor,
      ),
    );
  }
}
