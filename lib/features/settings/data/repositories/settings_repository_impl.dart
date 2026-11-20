import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/storage_service.dart';
import '../../domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  SettingsRepositoryImpl({required StorageService storageService})
    : _storageService = storageService;

  final StorageService _storageService;

  @override
  bool get isDarkMode =>
      _storageService.read<bool>(AppConstants.storageThemeKey) ?? false;

  @override
  String get languageCode =>
      _storageService.read<String>(AppConstants.storageLocaleKey) ?? 'ar';

  @override
  Future<void> saveThemeMode(bool isDarkMode) async {
    await _storageService.write(AppConstants.storageThemeKey, isDarkMode);
  }

  @override
  Future<void> saveLanguageCode(String languageCode) async {
    await _storageService.write(AppConstants.storageLocaleKey, languageCode);
  }
}
