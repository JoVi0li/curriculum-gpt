import 'package:flutter/material.dart';

class CustomButtonTheme {
  static ElevatedButtonThemeData elevatedButtonLightTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.maxFinite, 60),
        backgroundColor: const Color(0xFF424242).withOpacity(0.5),
        foregroundColor: Colors.white,
        shadowColor: Colors.transparent,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 19),
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    );
  }
}
