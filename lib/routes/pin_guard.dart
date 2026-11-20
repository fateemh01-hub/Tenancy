import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/services/session_service.dart';
import 'app_routes.dart';

class PinGuard extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final session = Get.find<SessionService>();

    if (!session.isAuthenticated) {
      return const RouteSettings(name: AppRoutes.pin);
    }

    return null;
  }
}
