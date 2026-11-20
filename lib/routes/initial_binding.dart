import 'package:get/get.dart';

import '../core/services/api_client.dart';
import '../core/services/storage_service.dart';
import '../core/theme/theme_controller.dart';

import '../features/settings/data/repositories/settings_repository_impl.dart';
import '../features/settings/domain/repositories/settings_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ApiClient>(ApiClient(), permanent: true);

    Get.lazyPut<SettingsRepository>(
      () => SettingsRepositoryImpl(storageService: Get.find<StorageService>()),
      fenix: true,
    );

    Get.put<ThemeController>(
      ThemeController(settingsRepository: Get.find<SettingsRepository>()),
      permanent: true,
    );
  }
}
