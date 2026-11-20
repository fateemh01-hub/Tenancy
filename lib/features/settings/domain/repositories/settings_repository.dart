abstract class SettingsRepository {
  bool get isDarkMode;

  String get languageCode;

  Future<void> saveThemeMode(bool isDarkMode);

  Future<void> saveLanguageCode(String languageCode);
}
