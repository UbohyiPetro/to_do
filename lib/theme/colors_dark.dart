import 'package:flutter/material.dart';

class AppColorsDark {
  ColorScheme getAppColors() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFFFD600),
      onPrimary: Color(0xFFF1F0F0),
      secondary: Color(0xFFFBEFB4),
      onSecondary: Color(0xFFF2C8C8),
      surface: Color(0xFF1F1F1F),
      onSurface: Color(0xFF383838),
      error: Color(0xFFD94141),
      onError: Color(0xFFFAFAFA),
    );
  }
}
