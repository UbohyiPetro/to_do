import 'package:get/get.dart';
import 'package:softwars_to_do/database/app_database.dart';
import 'package:softwars_to_do/database/dao/todo_dao.dart';
import 'package:softwars_to_do/database/entity/todo_entity.dart';

class TodoStorage {
  final TodoDao _todoDao = Get.find<AppDatabase>().todoDao;

  Future<void> insertTodo(TodoEntity todoEntity) async {
    await _todoDao.insertTodo(todoEntity);
  }

  Stream<List<TodoEntity>> observeTodos() {
    return _todoDao.observeTodos();
  }

  Future<TodoEntity?> findTodoById(String id) {
    return _todoDao.findTodoById(id);
  }

  Future<void> updateTodo(TodoEntity todoEntity) {
    return _todoDao.updateTodo(todoEntity);
  }
}
