import 'package:get/get.dart';
import 'package:softwars_to_do/database/entity/task_entity.dart';
import 'package:softwars_to_do/storage/todo_storage.dart';

class TodoRepository {
  final TodoStorage _todoStorage = Get.find();

  Stream<List<TaskEntity>> observeTodos() {
    return _todoStorage.observeTodos();
  }

  Future<void> addTodo(TaskEntity todoEntity) {
    return _todoStorage.insertTodo(todoEntity);
  }

  Future<TaskEntity?> findTodoById(String id) {
    return _todoStorage.findTodoById(id);
  }

  Future<void> updateTodo(TaskEntity todoEntity) {
    return _todoStorage.updateTodo(todoEntity);
  }

  Future<void> deleteTodoById(String taskId) {
    return _todoStorage.deleteTodo(taskId);
  }
}
