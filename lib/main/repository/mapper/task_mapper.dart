import 'package:softwars_to_do/api/model/task_api.dart';
import 'package:softwars_to_do/database/entity/todo_entity.dart';

extension ToTaskEntity on TaskApi {
  TodoEntity toTaskEntity() {
    return TodoEntity(
      taskId: taskId,
      status: status,
      name: name,
      type: type,
      description: description,
      file: file,
      finishDate: finishDate,
      urgent: urgent,
    );
  }
}
