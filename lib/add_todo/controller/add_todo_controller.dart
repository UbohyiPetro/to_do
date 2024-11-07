import 'package:get/get.dart';
import 'package:softwars_to_do/add_todo/state/add_todo_state.dart';
import 'package:softwars_to_do/database/repository/todo_repository.dart';
import 'package:softwars_to_do/main/mapper/todo_mapper.dart';

class AddTodoController extends GetxController {
  final TodoRepository _todoRepository = Get.find();
  final AddTodoState addTodoState = AddTodoState();

  Future<void> addTodo() async {
    await _todoRepository.addTodo(addTodoState.getTodoItem().toTodoEntity());
  }
}
