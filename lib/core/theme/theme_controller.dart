import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/settings/domain/repositories/settings_repository.dart';

class ThemeController extends GetxController {
  ThemeController({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository;

  final SettingsRepository _settingsRepository;

  late final Rx<ThemeMode> themeMode;
  late final Rx<Locale> locale;

  Worker? _themeWorker;

  @override
  void onInit() {
    super.onInit();

    themeMode =
        (_settingsRepository.isDarkMode ? ThemeMode.dark : ThemeMode.light).obs;

    locale = _localeFromCode(_settingsRepository.languageCode).obs;

    // Keep Flutter's active theme and persistent settings synchronized.
    _themeWorker = ever<ThemeMode>(themeMode, (mode) {
      Get.changeThemeMode(mode);
      _settingsRepository.saveThemeMode(mode == ThemeMode.dark);
    });
  }

  Future<void> toggleTheme() async {
    themeMode.value = themeMode.value == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
  }

  Future<void> changeLanguage(String languageCode) async {
    final normalizedCode = languageCode == 'ar' ? 'ar' : 'en';
    final selectedLocale = _localeFromCode(normalizedCode);

    locale.value = selectedLocale;
    Get.updateLocale(selectedLocale);
    await _settingsRepository.saveLanguageCode(normalizedCode);
  }

  Locale _localeFromCode(String languageCode) {
    return languageCode == 'ar'
        ? const Locale('ar', 'SA')
        : const Locale('en', 'US');
  }

  @override
  void onClose() {
    _themeWorker?.dispose();
    super.onClose();
  }
}
