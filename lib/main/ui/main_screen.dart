import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softwars_to_do/main/controller/main_controller.dart';
import 'package:softwars_to_do/main/ui/todo_item_сard.dart';

import '../../navigation/navigation.dart';
import '../../theme/spacing.dart';
import '../model/todo_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainController = Get.put(MainController());
    final mainState = mainController.mainState;
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(Spacing.medium),
        child: FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Get.toNamed(Routes.addTodo);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Spacing.semiLarge,
            horizontal: Spacing.medium,
          ),
          child: Obx(
            () => Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ToggleButton(
                        label: 'Усі',
                        isSelected: mainController.isFilterSelected(0),
                        onTap: () {
                          mainState.filterValue.value = 0;
                          mainController
                              .applyFilter(mainState.filterValue.value);
                        },
                      ),
                    ),
                    Expanded(
                      child: ToggleButton(
                        label: 'Робочі',
                        isSelected: mainController.isFilterSelected(1),
                        onTap: () {
                          mainState.filterValue.value = 1;
                          mainController
                              .applyFilter(mainState.filterValue.value);
                        },
                      ),
                    ),
                    Expanded(
                      child: ToggleButton(
                        label: 'Особисті',
                        isSelected: mainController.isFilterSelected(2),
                        onTap: () {
                          mainState.filterValue.value = 2;
                          mainController
                              .applyFilter(mainState.filterValue.value);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Spacing.semiLarge),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(bottom: Spacing.large),
                    itemCount: mainController.isFilterApplied()
                        ? mainState.filteredTodos.length
                        : mainState.todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      TodoItem todoItem = mainController.isFilterApplied()
                          ? mainState.filteredTodos[index]
                          : mainState.todos[index];
                      return TodoItemCard(
                        todoItem: todoItem,
                      );
                    },
                  ),
                )
              ],
            ),
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
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.tiny),
      child: InkWell(
        borderRadius: BorderRadius.circular(Spacing.semiLarge),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? colorScheme.tertiary : Colors.transparent,
            borderRadius: BorderRadius.circular(Spacing.semiLarge),
            border: Border.all(
              color: isSelected ? Colors.transparent : colorScheme.tertiary,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.medium,
            vertical: Spacing.small,
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: isSelected ? colorScheme.surface : colorScheme.tertiary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
