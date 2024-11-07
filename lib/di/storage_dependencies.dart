import 'package:get/get.dart';
import 'package:softwars_to_do/storage/todo_storage.dart';

void putStorageDependencies() {
  Get.lazyPut(() => TodoStorage(), fenix: true);
}
