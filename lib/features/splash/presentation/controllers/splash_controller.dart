import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _openNextScreen();
  }

  Future<void> _openNextScreen() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    Get.offAllNamed(AppRoutes.pin);
  }
}
