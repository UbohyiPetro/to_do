import 'package:get/get.dart';
import 'package:softwars_to_do/main/model/todo_item.dart';

class MainState {
  RxList<TodoItem> todos = RxList();
  RxList<TodoItem> filteredTodos = RxList();
  RxInt filterValue = RxInt(0);
}
