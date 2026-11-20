import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/errors/presentation/screens/not_found_screen.dart';
import 'core/locale/app_translations.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

class StarterApp extends StatelessWidget {
  const StarterApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(
      () => GetMaterialApp(
        title: 'Starter App',
        debugShowCheckedModeBanner: false,
        translations: AppTranslations(),
        locale: themeController.locale.value,
        fallbackLocale: const Locale('en', 'US'),
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeController.themeMode.value,
        initialRoute: AppRoutes.splash,
        getPages: AppPages.pages,
        unknownRoute: GetPage(
          name: AppRoutes.notFound,
          page: () => const NotFoundScreen(),
        ),
      ),
    );
  }
}
