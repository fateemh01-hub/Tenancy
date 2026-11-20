import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'core/services/session_service.dart';
import 'core/services/storage_service.dart';
import 'routes/initial_binding.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize persistent services before any controller uses them.
  await Get.putAsync<StorageService>(
    () => StorageService().init(),
    permanent: true,
  );

  await Get.putAsync<SessionService>(
    () => SessionService(storage: Get.find<StorageService>()).init(),
    permanent: true,
  );

  // Register app-wide controllers after their required services exist.
  InitialBinding().dependencies();

  runApp(const StarterApp());
}
