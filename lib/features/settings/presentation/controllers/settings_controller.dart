import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/theme_controller.dart';

class SettingsViewData {
  final bool isDarkMode;
  final String languageCode;

  SettingsViewData({required this.isDarkMode, required this.languageCode});
}

class SettingsController extends GetxController
    with StateMixin<SettingsViewData> {
  ThemeController get themeController => Get.find<ThemeController>();

  @override
  void onInit() {
    super.onInit();
    loadSettings();
  }

  Future<void> loadSettings() async {
    change(null, status: RxStatus.loading());

    final data = SettingsViewData(
      isDarkMode: themeController.themeMode.value == ThemeMode.dark,
      languageCode: themeController.locale.value.languageCode,
    );

    change(data, status: RxStatus.success());
  }

  Future<void> toggleTheme() async {
    await themeController.toggleTheme();
    await loadSettings();
  }

  Future<void> changeLanguage(String code) async {
    await themeController.changeLanguage(code);
    await loadSettings();
  }
}
