import 'package:intl/intl.dart';
import 'package:softwars_to_do/database/entity/todo_entity.dart';
import 'package:softwars_to_do/main/model/todo_item.dart';

extension ToTodoItem on TodoEntity {
  TodoItem toTodoItem() {
    return TodoItem(
      taskId: taskId,
      status: status,
      name: name,
      type: type,
      description: description,
      file: file,
      finishDate: DateTime.parse(finishDate),
      urgent: urgent,
    );
  }
}

extension ToTodoEntity on TodoItem {
  TodoEntity toTodoEntity() {
    return TodoEntity(
      taskId: taskId,
      status: status,
      name: name,
      type: type,
      description: description,
      file: file,
      finishDate: DateFormat('yyyy-dd-MM').format(finishDate),
      urgent: urgent,
    );
  }
}
