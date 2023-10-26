import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final ThemeData themeData = ThemeData(
  useMaterial3: true,
  fontFamily: "Serala",
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      fixedSize: Size(
        311.w,
        61.h,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          61,
        ),
      ),
    ),
  ),
);
