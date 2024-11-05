import 'package:flutter/material.dart';

import '../../theme/spacing.dart';

class TodoCheckbox extends StatelessWidget {
  final bool isChecked;
  final Color? borderColor;
  final VoidCallback onChanged;

  const TodoCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      onTap: onChanged,
      child: Container(
        width: Spacing.large,
        height: Spacing.large,
        decoration: BoxDecoration(
          color: isChecked ? colorScheme.tertiary : null,
          border: Border.all(
            width: 1,
            color: borderColor ?? Colors.black,
          ),
          borderRadius: BorderRadius.circular(
            Spacing.tiny,
          ),
        ),
        child: isChecked
            ? Icon(Icons.check, color: colorScheme.surface, size: 22)
            : null,
      ),
    );
  }
}
