import 'package:get/get.dart';
import 'package:softwars_to_do/database/app_database.dart';
import 'package:softwars_to_do/database/dao/todo_dao.dart';

class TodoStorage {
  final TodoDao _todoDao = Get.find<AppDatabase>().todoDao;
}
