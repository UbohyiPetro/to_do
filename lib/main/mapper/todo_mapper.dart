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
      finishDate: DateFormat('yyyy-MM-dd').parse(finishDate),
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
      finishDate: DateFormat('dd.MM.yyyy').format(finishDate),
      urgent: urgent,
    );
  }
}
