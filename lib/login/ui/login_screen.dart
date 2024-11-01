import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navigation/navigation.dart';
import '../../theme/spacing.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Align(
            alignment: const Alignment(0, 0.5),
            child: Padding(
              padding: const EdgeInsets.all(Spacing.medium),
              child: FilledButton(
                onPressed: () {
                  Get.toNamed(Routes.main);
                },
                style: FilledButton.styleFrom(
                  elevation: 0,
                  minimumSize: const Size(
                    double.infinity,
                    Spacing.defaultButton,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      Spacing.radiusExtraMedium,
                    ),
                  ),
                ),
                child: const Text(
                  'Вхід',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
