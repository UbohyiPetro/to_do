import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softwars_to_do/di/app_dependencies.dart';
import 'package:softwars_to_do/navigation/navigation.dart';
import 'package:softwars_to_do/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await putDependencies();
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
