import 'package:get/get.dart';
import 'package:softwars_to_do/api/todo_api.dart';
import 'package:softwars_to_do/main/mapper/todo_mapper.dart';
import 'package:softwars_to_do/main/model/todo_item.dart';
import 'package:softwars_to_do/main/repository/mapper/task_mapper.dart';
import 'package:softwars_to_do/storage/todo_storage.dart';

class TaskRepository {
  final TodoStorage _todoStorage = Get.find();
  final TodoApi _todoApi = Get.find();

  Stream<List<TodoItem>> observeTasks() {
    return _todoStorage.observeTodos().map((entities) {
      return entities.map((entity) => entity.toTodoItem()).toList();
    });
  }

  void fetchTasks() async {
    var tasks = await _todoApi.fetchTasks();
    for (var task in tasks) {
      _todoStorage.insertTodo(task.toTaskEntity());
    }
  }
}
