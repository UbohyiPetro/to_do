import 'package:get/get.dart';
import 'package:softwars_to_do/database/repository/todo_repository.dart';
import '../main/repository/tasks_repository.dart';

void putRepositoryDependency() {
  Get.lazyPut(() => TodoRepository(), fenix: true);
  Get.lazyPut(() => TaskRepository(), fenix: true);
}
