import 'package:intl/intl.dart';
import 'package:softwars_to_do/edit_todo/state/edit_todo_state.dart';
import 'package:softwars_to_do/main/model/task_item.dart';

extension ToTodoItem on EditTodoState {
  TaskItem toTodoItem(String taskId) {
    return TaskItem(
      taskId: taskId,
      status: status.value,
      name: nameController.value.text,
      type: isTypePrivate.value == 1 ? 2 : 1,
      description: descriptionController.value.text,
      file: '',
      finishDate: DateFormat('dd.MM.yyyy').parse(finishDate.value),
      urgent: urgent.value,
    );
  }
}
