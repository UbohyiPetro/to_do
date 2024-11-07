import 'package:get/get.dart';
import 'package:softwars_to_do/di/repository_dependencies.dart';
import 'package:softwars_to_do/di/storage_dependencies.dart';

import '../database/app_database.dart';

Future<void> putDependencies() async {
  await Get.putAsync<AppDatabase>(permanent: true, () => AppDatabase.init());
  putStorageDependencies();
  putRepositoryDependencies();
}
