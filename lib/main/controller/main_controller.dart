import 'package:get/get.dart';
import 'package:softwars_to_do/api/todo_api.dart';
import 'package:softwars_to_do/database/repository/todo_repository.dart';
import 'package:softwars_to_do/main/mapper/todo_mapper.dart';
import 'package:softwars_to_do/main/model/todo_item.dart';
import 'package:softwars_to_do/main/state/main_state.dart';

class MainController extends GetxController {
  final TodoRepository _todoRepository = Get.find();
  final TodoApi _todoApi = TodoApi();
  final MainState mainState = MainState();

  @override
  void onInit() async {
    _observeTodos();
    var todos = await _todoApi.fetchTasks();
    print(todos.length);
    super.onInit();
  }

  void _observeTodos() {
    _todoRepository.observeTodos().listen((todoEntityList) {
      mainState.todos.value =
          todoEntityList.map((todoEntity) => todoEntity.toTodoItem()).toList();
    });
  }

  void updateTodoStatus(TodoItem todoItem) {
    var status = todoItem.status == 1 ? 2 : 1;
    _todoRepository
        .updateTodo(todoItem.copyWith(status: status).toTodoEntity());
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
