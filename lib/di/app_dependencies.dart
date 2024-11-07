import 'package:get/get.dart';

import '../database/app_database.dart';

Future<void> putDependencies() async {
  await Get.putAsync<AppDatabase>(permanent: true, () => AppDatabase.init());
}
