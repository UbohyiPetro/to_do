import 'package:get/get.dart';
import 'package:softwars_to_do/database/repository/todo_repository.dart';

void putRepositoryDependencies() {
  Get.lazyPut(() => TodoRepository(), fenix: true);
}
