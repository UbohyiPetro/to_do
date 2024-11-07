import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:softwars_to_do/main/model/todo_item.dart';

class AddTodoState {
  RxInt urgent = RxInt(0);
  RxInt isTypeWork = RxInt(0);
  RxInt isTypePrivate = RxInt(1);
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  TodoItem getTodoItem() {
    return TodoItem(
      taskId: DateTime.now().millisecondsSinceEpoch.toString(),
      status: 1,
      name: nameController.text.trim(),
      type: isTypePrivate.value == 1 ? 2 : 1,
      description: descriptionController.text.trim(),
      finishDate: DateTime.now(),
      urgent: urgent.value,
      file: '',
    );
  }
}
