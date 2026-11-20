import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/session_service.dart';
import '../../../../routes/app_routes.dart';

class PinController extends GetxController {
  final pinController = TextEditingController();
  final confirmPinController = TextEditingController();
  final isPinVisible = false.obs;

  final SessionService _sessionService = Get.find<SessionService>();

  void togglePinVisibility() => isPinVisible.toggle();

  void continueToHome() {
    final pin = pinController.text.trim();

    if (pin.length != AppConstants.pinLength || !GetUtils.isNumericOnly(pin)) {
      _showError('pin_error'.tr);
      return;
    }

    if (!_sessionService.isPinConfigured) {
      _showPinSetupDialog(pin);
      return;
    }

    if (!_sessionService.verifyPin(pin)) {
      _showError('wrong_pin'.tr);
      return;
    }

    _openHome();
  }

  void _showPinSetupDialog(String pin) {
    confirmPinController.clear();

    Get.defaultDialog(
      title: 'set_pin'.tr,
      content: Column(
        children: [
          Text('confirm_pin'.tr),
          const SizedBox(height: 12),
          TextField(
            controller: confirmPinController,
            keyboardType: TextInputType.number,
            obscureText: true,
            maxLength: AppConstants.pinLength,
            inputFormatters: const [],
            decoration: InputDecoration(
              hintText: 'pin_hint'.tr,
              counterText: '',
            ),
          ),
        ],
      ),
      textConfirm: 'save'.tr,
      textCancel: 'cancel'.tr,
      onConfirm: () async {
        final confirmation = confirmPinController.text.trim();

        if (confirmation.length != AppConstants.pinLength ||
            !GetUtils.isNumericOnly(confirmation)) {
          _showError('pin_error'.tr);
          return;
        }

        if (confirmation != pin) {
          _showError('pin_mismatch'.tr);
          return;
        }

        await _sessionService.configurePin(pin);
        Get.back();
        _openHome();
      },
    );
  }

  void _openHome() {
    _sessionService.authenticate();
    Get.offAllNamed(AppRoutes.home);
  }

  void _showError(String message) {
    Get.snackbar('enter_pin'.tr, message, snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    pinController.dispose();
    confirmPinController.dispose();
    super.onClose();
  }
}
