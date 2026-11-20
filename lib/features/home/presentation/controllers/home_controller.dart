import 'package:get/get.dart';
import '../../../../core/services/session_service.dart';
import '../../../../core/theme/theme_controller.dart';
import '../../../../routes/app_routes.dart';

class HomeController extends GetxController {
  ThemeController get settings => Get.find<ThemeController>();

  bool showDetails = false;

  Future<void> toggleTheme() => settings.toggleTheme();

  Future<void> setLanguage(String code) => settings.changeLanguage(code);

  void backToPin() {
    Get.find<SessionService>().endSession();
    Get.offAllNamed(AppRoutes.pin);
  }

  void openSettings() {
    Get.toNamed(AppRoutes.settings);
  }

  void openAbout() {
    Get.toNamed(AppRoutes.aboutSection('overview'));
  }

  void toggleDetails() {
    showDetails = !showDetails;
    update(['home_details']);
  }
}
