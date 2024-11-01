import 'package:flutter/material.dart';
import 'colors_dark.dart';
import 'colors_light.dart';

class AppColors {
  final bool isDark;

  AppColors({required this.isDark});

  ColorScheme getAppColors() {
    return isDark
        ? AppColorsDark().getAppColors()
        : AppColorsLight().getAppColors();
  }
}
