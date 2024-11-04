import 'package:flutter/material.dart';

import '../../theme/spacing.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const selectedIndex = 0;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Spacing.semiLarge,
            horizontal: Spacing.medium,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: ToggleButton(
                      label: 'Усі',
                      isSelected: selectedIndex == 0,
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: ToggleButton(
                      label: 'Робочі',
                      isSelected: selectedIndex == 1,
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: ToggleButton(
                      label: 'Особисті',
                      isSelected: selectedIndex == 2,
                      onTap: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ToggleButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.yellow.shade100 : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? Colors.transparent : Colors.yellow.shade100,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: isSelected ? Colors.black : Colors.yellow.shade100,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
