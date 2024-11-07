import 'dart:convert';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:softwars_to_do/database/repository/todo_repository.dart';
import 'package:softwars_to_do/edit_todo/mapper/edit_todo_mapper.dart';
import 'package:softwars_to_do/edit_todo/state/edit_todo_state.dart';
import 'package:softwars_to_do/main/mapper/todo_mapper.dart';
import 'package:softwars_to_do/main/model/todo_item.dart';

class EditTodoController extends GetxController {
  final TodoRepository _todoRepository = Get.find();
  final EditTodoState editTodoState = EditTodoState();
  final String taskId = Get.arguments;

  @override
  void onInit() async {
    super.onInit();
    await _todoRepository.findTodoById(taskId).then((todoEntity) {
      TodoItem todoItem = todoEntity!.toTodoItem();
      editTodoState.nameController.value.text = todoItem.name;
      editTodoState.descriptionController.value.text = todoItem.description;
      if (todoItem.type == 1) {
        editTodoState.isTypeWork.value = 1;
      } else {
        editTodoState.isTypePrivate.value = 1;
      }
      editTodoState.urgent.value = todoItem.urgent;
      editTodoState.finishDate.value =
          DateFormat('dd.MM.yyyy').format(todoItem.finishDate);
      editTodoState.file.value = todoItem.file.isNotEmpty
          ? const Base64Decoder().convert(todoItem.file)
          : null;
      editTodoState.status.value = todoItem.status;
      editTodoState.isLoading.value = false;
    });
  }

  Future<void> editTodo() async {
    await _todoRepository
        .updateTodo(editTodoState.toTodoItem(taskId).toTodoEntity());
  }

  Future<void> deleteTodo() async {
    await _todoRepository.deleteTodoById(taskId);
  }

  Future<void> selectImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      // editTodoState.file.value = File(file.path);
    }
  }

  void onDateSelect(DateTime newDate) {
    editTodoState.finishDate.value = DateFormat('dd.MM.yyyy').format(newDate);
  }
}
