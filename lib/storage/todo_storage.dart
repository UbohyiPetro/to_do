import 'package:get/get.dart';
import 'package:softwars_to_do/database/app_database.dart';
import 'package:softwars_to_do/database/dao/todo_dao.dart';
import 'package:softwars_to_do/database/entity/task_entity.dart';

class TodoStorage {
  final TodoDao _todoDao = Get.find<AppDatabase>().todoDao;

  Future<void> insertTodo(TaskEntity todoEntity) async {
    await _todoDao.insertTodo(todoEntity);
  }

  Stream<List<TaskEntity>> observeTodos() {
    return _todoDao.observeTodos();
  }

  Future<TaskEntity?> findTodoById(String id) {
    return _todoDao.findTodoById(id);
  }

  Future<void> updateTodo(TaskEntity todoEntity) {
    return _todoDao.updateTodo(todoEntity);
  }

  Future<void> deleteTodo(String id) {
    return _todoDao.deleteTodoById(id);
  }
}
