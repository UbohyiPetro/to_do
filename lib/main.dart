import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softwars_to_do/navigation/navigation.dart';
import 'package:softwars_to_do/theme/app_theme.dart';

void main() {
  runApp(const SoftWarsTodoApp());
}

class SoftWarsTodoApp extends StatelessWidget {
  const SoftWarsTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.login,
      getPages: AppPages.pages,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
