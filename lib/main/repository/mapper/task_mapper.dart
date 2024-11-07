import 'package:intl/intl.dart';
import 'package:softwars_to_do/api/model/task_api.dart';
import 'package:softwars_to_do/database/entity/task_entity.dart';
import 'package:softwars_to_do/main/model/task_item.dart';

extension ToTaskEntity on TaskApi {
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

extension ToTaskApi on TaskItem {
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
