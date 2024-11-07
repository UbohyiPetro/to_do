import 'package:softwars_to_do/database/entity/task_entity.dart';
import 'package:softwars_to_do/main/model/task_item.dart';

extension ToTodoItem on TaskEntity {
  TaskItem toTodoItem() {
    return TaskItem(
      taskId: taskId,
      status: status,
      name: name,
      type: type,
      description: description,
      file: file,
      finishDate: DateTime.fromMillisecondsSinceEpoch(finishDate),
      urgent: urgent,
    );
  }
}

extension ToTaskEntity on TaskItem {
  TaskEntity toTaskEntity() {
    return TaskEntity(
      taskId: taskId,
      status: status,
      name: name,
      type: type,
      description: description,
      file: file,
      finishDate: finishDate.millisecondsSinceEpoch,
      urgent: urgent,
    );
  }
}
