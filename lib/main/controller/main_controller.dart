import 'package:get/get.dart';
import 'package:softwars_to_do/main/model/todo_item.dart';
import 'package:softwars_to_do/main/state/main_state.dart';

class MainController extends GetxController {
  final MainState mainState = MainState();

  void refreshTodos() {
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
    refreshTodos();
  }

  bool isFilterSelected(int filterValue) =>
      mainState.filterValue.value == filterValue ? true : false;

  bool isFilterApplied() => mainState.filterValue.value != 0 ? true : false;

  void applyFilter(int filterValue) {
    if (filterValue == 1) {
      mainState.filteredTodos.value =
          mainState.todos.where((todo) => todo.type == 1).toList();
    } else if (filterValue == 2) {
      mainState.filteredTodos.value =
          mainState.todos.where((todo) => todo.type == 2).toList();
    }
  }
}
