import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:softwars_to_do/add_todo/state/add_todo_state.dart';

import '../../main/repository/tasks_repository.dart';

class AddTodoController extends GetxController {
  final TaskRepository _taskRepository = Get.find();
  final AddTodoState addTodoState = AddTodoState();

  void addTask() {
    _taskRepository.addTask(addTodoState.getTodoItem());
  }

  void onDateSelect(DateTime newDate) {
    addTodoState.finishDate.value = DateFormat('dd.MM.yyyy').format(newDate);
  }

  Future<void> selectImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      addTodoState.file.value = File(file.path);
    }
  }
}
