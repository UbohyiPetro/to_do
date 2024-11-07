import 'package:get/get.dart';
import 'package:softwars_to_do/main/model/task_item.dart';

class MainState {
  RxList<TaskItem> todos = RxList();
  RxList<TaskItem> filteredTodos = RxList();
  RxInt filterValue = RxInt(0);
}
