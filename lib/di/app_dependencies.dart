import 'package:get/get.dart';
import 'package:softwars_to_do/di/repository_dependency.dart';
import 'package:softwars_to_do/di/storage_dependency.dart';

import '../database/app_database.dart';
import 'api_dependency.dart';

Future<void> putDependencies() async {
  await Get.putAsync<AppDatabase>(permanent: true, () => AppDatabase.init());
  putStorageDependency();
  putRepositoryDependency();
  putApiDependency();
}
