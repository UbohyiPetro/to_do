import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../theme/spacing.dart';
import '../components/todo_checkbox.dart';
import '../model/todo_item.dart';

class TodoItemCard extends StatelessWidget {
  final Function(TodoItem) onClick;
  final TodoItem todoItem;

  const TodoItemCard({
    super.key,
    required this.todoItem,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      color: todoItem.urgent == 0
          ? colorScheme.onSecondary
          : colorScheme.tertiaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(Spacing.small),
        child: Row(
          children: [
            Icon(
              size: 32,
              todoItem.type == 1 ? Icons.work_outline : Icons.home_outlined,
              color: Colors.black,
            ),
            const SizedBox(
              width: Spacing.small,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todoItem.name,
                    style: const TextStyle(
                      height: 1.2,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy').format(todoItem.finishDate),
                    style: const TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(width: Spacing.small),
            TodoCheckbox(
              isChecked: todoItem.status == 1 ? false : true,
              onChanged: () {
                onClick(todoItem);
              },
            )
          ],
        ),
      ),
    );
  }
}
