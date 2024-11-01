import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:softwars_to_do/theme/app_theme.dart';

import 'login/ui/login_screen.dart';

void main() {
  runApp(const SoftWarsTodoApp());
}

class SoftWarsTodoApp extends StatelessWidget {
  const SoftWarsTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const LoginScreen(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
