import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softwars_to_do/main/components/todo_checkbox.dart';

import '../../theme/spacing.dart';

class AddToDoScreen extends StatelessWidget {
  const AddToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.large),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.medium,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: Spacing.small),
                      const Expanded(
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                          // maxLines: 3,
                          decoration: InputDecoration(
                            hintText: "Назва завдання...",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: colorScheme.secondary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: 0,
                            onChanged: (value) {},
                            activeColor: colorScheme.primary,
                          ),
                          const Text('Робочі'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: 0,
                            onChanged: (value) {},
                            activeColor: colorScheme.primary,
                          ),
                          const Text('Особисті'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Spacing.small),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.medium,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.secondary,
                  ),
                  child: const TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Додати опис...',
                    ),
                  ),
                ),
                const SizedBox(height: Spacing.small),
                Container(
                  padding: const EdgeInsets.all(Spacing.medium),
                  decoration: BoxDecoration(
                    color: colorScheme.secondary,
                  ),
                  child: const Row(
                    children: [
                      Text('Прикріпити файл'),
                    ],
                  ),
                ),
                const SizedBox(height: Spacing.small),
                Container(
                  padding: const EdgeInsets.all(Spacing.medium),
                  decoration: BoxDecoration(
                    color: colorScheme.secondary,
                  ),
                  child: const Row(
                    children: [
                      Text('Дата завершення:'),
                    ],
                  ),
                ),
                const SizedBox(height: Spacing.small),
                Container(
                  color: colorScheme.secondary,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(Spacing.small),
                        child: TodoCheckbox(
                          isChecked: true,
                          onChanged: () {},
                          borderColor: colorScheme.tertiary,
                        ),
                      ),
                      const Text('Термінове'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Spacing.medium,
                    vertical: Spacing.semiLarge,
                  ),
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(Spacing.defaultButton),
                      padding: const EdgeInsets.symmetric(
                        vertical: Spacing.medium,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Spacing.medium),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Створити',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
