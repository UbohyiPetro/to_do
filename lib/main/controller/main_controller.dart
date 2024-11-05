import 'package:get/get.dart';
import 'package:softwars_to_do/main/model/todo_item.dart';
import 'package:softwars_to_do/main/state/main_state.dart';

class MainController extends GetxController {
  final MainState mainState = MainState();

  void addTodo(TodoItem todoItem) {
    mainState.todos.add(todoItem);
  }
}
