import 'package:get/get.dart';

import '../features/home/presentation/bindings/home_binding.dart';
import '../features/home/presentation/screens/home_screen.dart';

import '../features/pin/presentation/bindings/pin_binding.dart';
import '../features/pin/presentation/screens/pin_screen.dart';

import '../features/splash/presentation/bindings/splash_binding.dart';
import '../features/splash/presentation/screens/splash_screen.dart';

import '../features/settings/presentation/controllers/settings_controller.dart';
import '../features/settings/presentation/screens/settings_screen.dart';

import '../features/about/presentation/screens/about_screen.dart';
import '../features/errors/presentation/screens/not_found_screen.dart';

import 'app_routes.dart';
import 'pin_guard.dart';

class AppPages {
  AppPages._();

  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.pin,
      page: () => const PinScreen(),
      binding: PinBinding(),
    ),

    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
      middlewares: [PinGuard()],
    ),

    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SettingsController>(
          () => SettingsController(),
          fenix: true,
        );
      }),
      middlewares: [PinGuard()],
    ),

    GetPage(name: AppRoutes.about, page: () => const AboutScreen()),

    GetPage(name: AppRoutes.notFound, page: () => const NotFoundScreen()),
  ];
}
