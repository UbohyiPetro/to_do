import 'package:flutter/material.dart';

class AppColorsDark {
  ColorScheme getAppColors() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFFFD600),
      onPrimary: Color(0xFF383838),
      secondary: Color(0xFF383838),
      onSecondary: Color(0xFFF1F0F0),
      surface: Color(0xFF1F1F1F),
      onSurface: Color(0xFFFAFAFA),
      error: Color(0xFFD94141),
      onError: Color(0xFFFAFAFA),
      tertiary: Color(0xFFFBEFB4),
    );
  }
}
