import 'package:get/get.dart';
import 'package:softwars_to_do/api/todo_api.dart';

void putApiDependency() {
  Get.lazyPut(() => TodoApi(), fenix: true);
}
