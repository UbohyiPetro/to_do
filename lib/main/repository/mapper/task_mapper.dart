import 'package:intl/intl.dart';
import 'package:softwars_to_do/api/model/task_api.dart';
import 'package:softwars_to_do/database/entity/task_entity.dart';
import 'package:softwars_to_do/main/model/task_item.dart';

extension TaskApiToTaskEntity on TaskApi {
  TaskEntity toTaskEntity() {
    return TaskEntity(
      taskId: taskId,
      status: status,
      name: name,
      type: type,
      description: description,
      file: file,
      finishDate:
          DateFormat('yyyy-MM-dd').parse(finishDate).millisecondsSinceEpoch,
      urgent: urgent,
    );
  }
}

extension TaskItemToTaskApi on TaskItem {
  TaskApi toTaskApi() {
    return TaskApi(
      taskId: taskId,
      status: status,
      name: name,
      type: type,
      description: description,
      file: file,
      finishDate: DateFormat('yyyy-MM-dd').format(finishDate),
      urgent: urgent,
    );
  }
}

extension TaskItemToTaskEntity on TaskItem {
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

extension TaskEntityToTaskItem on TaskEntity {
  TaskItem toTaskItem() {
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
