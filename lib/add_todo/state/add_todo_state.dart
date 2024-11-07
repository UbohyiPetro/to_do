import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:softwars_to_do/main/model/todo_item.dart';

class AddTodoState {
  RxInt urgent = RxInt(0);
  RxInt isTypeWork = RxInt(0);
  RxInt isTypePrivate = RxInt(1);
  Rx<File?> file = Rx(null);
  RxString finishDate =
      RxString(DateFormat('dd.MM.yyyy').format(DateTime.now()));
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();

  TodoItem getTodoItem() {
    return TodoItem(
      taskId: DateTime.now().millisecondsSinceEpoch.toString(),
      status: 1,
      name: nameController.text.trim(),
      type: isTypePrivate.value == 1 ? 2 : 1,
      description: descriptionController.text.trim(),
      finishDate: DateFormat('dd.MM.yyyy').parse(finishDate.value),
      urgent: urgent.value,
      file:
          file.value != null ? base64Encode(file.value!.readAsBytesSync()) : '',
    );
  }
}
