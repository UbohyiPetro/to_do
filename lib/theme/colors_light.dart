import 'package:flutter/material.dart';

class AppColorsLight {
  ColorScheme getAppColors() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFFFFD600),
      onPrimary: Color(0xFFF1F0F0),
      secondary: Color(0xFF383838),
      onSecondary: Color(0xFFF1F0F0),
      surface: Color(0xFFFAFAFA),
      onSurface: Color(0xFF1F1F1F),
      error: Color(0xFFD94141),
      onError: Color(0xFFFAFAFA),
      tertiary: Color(0xFFFBEFB4),
      tertiaryContainer: Color(0xFFF2C8C8),
    );
  }
}
