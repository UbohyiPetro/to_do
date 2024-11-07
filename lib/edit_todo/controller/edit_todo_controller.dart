import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:softwars_to_do/edit_todo/mapper/edit_todo_mapper.dart';
import 'package:softwars_to_do/edit_todo/state/edit_todo_state.dart';
import 'package:softwars_to_do/main/model/task_item.dart';
import 'package:softwars_to_do/main/repository/mapper/task_mapper.dart';
import 'package:softwars_to_do/main/repository/tasks_repository.dart';

class EditTodoController extends GetxController {
  final TaskRepository _taskRepository = Get.find();
  final EditTodoState editTodoState = EditTodoState();
  final String taskId = Get.arguments;

  @override
  void onInit() async {
    super.onInit();
    await _taskRepository.findTodoById(taskId).then((todoEntity) {
      TaskItem taskItem = todoEntity!.toTaskItem();
      editTodoState.nameController.value.text = taskItem.name;
      editTodoState.descriptionController.value.text = taskItem.description;
      if (taskItem.type == 1) {
        editTodoState.isTypeWork.value = 1;
      } else {
        editTodoState.isTypePrivate.value = 1;
      }
      editTodoState.urgent.value = taskItem.urgent;
      editTodoState.finishDate.value =
          DateFormat('dd.MM.yyyy').format(taskItem.finishDate);
      // editTodoState.file.value = taskItem.file.isNotEmpty
      //     ? const Base64Decoder().convert(taskItem.file)
      //     : null;
      editTodoState.status.value = taskItem.status;
      editTodoState.isLoading.value = false;
    });
  }

  void editTask() {
    _taskRepository.editTask(editTodoState.toTodoItem(taskId));
  }

  void deleteTodo()  {
    _taskRepository.deleteTask(taskId);
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
