import 'package:get/get.dart';
import 'package:softwars_to_do/main/model/todo_item.dart';
import 'package:softwars_to_do/main/state/main_state.dart';

class MainController extends GetxController {
  final MainState mainState = MainState();

  void updateTodos() {
    mainState.todos.refresh();
  }

  void addTodo(TodoItem todoItem) {
    mainState.todos.add(todoItem);
  }

  void updateTodoStatus(TodoItem todoItem) {
    if (todoItem.status == 1) {
      todoItem.status = 2;
    } else {
      todoItem.status = 1;
    }
    updateTodos();
  }
}
