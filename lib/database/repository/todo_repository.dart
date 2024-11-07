import 'package:get/get.dart';
import 'package:softwars_to_do/database/entity/todo_entity.dart';
import 'package:softwars_to_do/storage/todo_storage.dart';

class TodoRepository {
  final TodoStorage _todoStorage = Get.find();

  Stream<List<TodoEntity>> observeTodos() {
    return _todoStorage.observeTodos();
  }

  Future<void> addTodo(TodoEntity todoEntity) {
    return _todoStorage.insertTodo(todoEntity);
  }

  Future<TodoEntity?> findTodoById(String id) {
    return _todoStorage.findTodoById(id);
  }

  Future<void> updateClient(TodoEntity todoEntity) {
    return _todoStorage.updateTodo(todoEntity);
  }
}
