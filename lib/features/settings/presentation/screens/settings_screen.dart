import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  void _showLanguageSheet() {
    Get.bottomSheet(
      SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('language'.tr, style: Get.textTheme.titleLarge),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text('arabic'.tr),
                onTap: () {
                  controller.changeLanguage('ar');
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.language),
                title: Text('english'.tr),
                onTap: () {
                  controller.changeLanguage('en');
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr)),
      body: controller.obx(
        (data) => ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              child: SwitchListTile(
                secondary: const Icon(Icons.dark_mode_outlined),
                title: Text('theme'.tr),
                subtitle: Text(
                  data!.isDarkMode ? 'dark_mode'.tr : 'light_mode'.tr,
                ),
                value: data.isDarkMode,
                onChanged: (_) => controller.toggleTheme(),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              child: ListTile(
                leading: const Icon(Icons.language),
                title: Text('language'.tr),
                subtitle: Text(
                  data.languageCode == 'ar' ? 'arabic'.tr : 'english'.tr,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: _showLanguageSheet,
              ),
            ),
          ],
        ),
        onLoading: const Center(child: CircularProgressIndicator()),
        onError: (error) => Center(child: Text(error ?? 'api_error'.tr)),
      ),
    );
  }
}
