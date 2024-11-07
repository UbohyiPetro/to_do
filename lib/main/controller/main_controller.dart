import 'package:get/get.dart';
import 'package:softwars_to_do/database/repository/todo_repository.dart';
import 'package:softwars_to_do/main/mapper/todo_mapper.dart';
import 'package:softwars_to_do/main/model/todo_item.dart';
import 'package:softwars_to_do/main/repository/tasks_repository.dart';
import 'package:softwars_to_do/main/state/main_state.dart';

class MainController extends GetxController {
  final TodoRepository _todoRepository = Get.find();
  final TaskRepository _taskRepository = Get.find();
  final MainState mainState = MainState();

  @override
  void onInit() {
    _taskRepository.fetchTasks();
    _observeTodos();
    super.onInit();
  }

  void _observeTodos() {
    _taskRepository.observeTasks().listen((tasks) {
      mainState.todos.value = tasks;
    });
  }

  void updateTodoStatus(TodoItem todoItem) {
    var status = todoItem.status == 1 ? 2 : 1;
    _todoRepository
        .updateTodo(todoItem.copyWith(status: status).toTaskEntity());
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
