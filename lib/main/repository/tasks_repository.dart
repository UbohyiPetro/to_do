import 'package:get/get.dart';
import 'package:softwars_to_do/api/todo_api.dart';
import 'package:softwars_to_do/database/entity/task_entity.dart';
import 'package:softwars_to_do/main/model/task_item.dart';
import 'package:softwars_to_do/main/repository/mapper/task_mapper.dart';
import 'package:softwars_to_do/storage/todo_storage.dart';

class TaskRepository {
  final TodoStorage _todoStorage = Get.find();
  final TodoApi _todoApi = Get.find();

  Stream<List<TaskItem>> observeTasks() {
    return _todoStorage.observeTodos().map((entities) {
      return entities.map((entity) => entity.toTaskItem()).toList();
    });
  }

  void fetchTasks() async {
    var tasks = await _todoApi.fetchTasks();
    for (var task in tasks) {
      _todoStorage.insertTodo(task.toTaskEntity());
    }
  }

  Future<TaskEntity?> findTodoById(String id) async {
    return _todoStorage.findTodoById(id);
  }

  void addTask(TaskItem taskItem) {
    _todoApi.upsertTask(taskItem.toTaskApi());
    _todoStorage.insertTodo(taskItem.toTaskEntity());
  }

  void editTask(TaskItem taskItem) {
    _todoApi.upsertTask(taskItem.toTaskApi());
    _todoStorage.updateTodo(taskItem.toTaskEntity());
  }

  void updateStatus(TaskItem taskItem) {
    _todoApi.updateStatus(taskItem.taskId, taskItem.status);
    _todoStorage.updateTodo(taskItem.toTaskEntity());
  }

  void deleteTask(String id) {
    _todoApi.deleteTask(id);
    _todoStorage.deleteTodo(id);
  }
}
