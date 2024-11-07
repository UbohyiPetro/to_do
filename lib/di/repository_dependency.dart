import 'package:get/get.dart';
import '../main/repository/tasks_repository.dart';

void putRepositoryDependency() {
  Get.lazyPut(() => TaskRepository(), fenix: true);
}
