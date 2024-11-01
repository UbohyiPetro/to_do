import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

class AppTheme {
  static var lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors(isDark: false).getAppColors().surface,
      ),
    ),
    colorScheme: AppColors(isDark: false).getAppColors(),
    useMaterial3: true,
  );

  static var darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors(isDark: true).getAppColors().surface,
      ),
    ),
    colorScheme: AppColors(isDark: true).getAppColors(),
    useMaterial3: true,
  );
}
