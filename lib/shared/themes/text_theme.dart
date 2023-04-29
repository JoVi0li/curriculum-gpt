import 'package:flutter/material.dart';

class CustomTextTheme {
   TextTheme call() {
    return const TextTheme(
      titleLarge: TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 32,
        color: Color(0xFFFFFFFF),
      ),
      titleMedium: TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
        fontSize: 28,
        color: Color(0xFFFFFFFF),
      ),
      bodyLarge: TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontSize: 20,
        color: Color(0xFFFFFFFF),
      ),
      bodyMedium: TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        color: Color(0xFFFFFFFF),
      ),
      bodySmall: TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        color: Color(0xFFFFFFFF),
      ),
    );
  }
}
