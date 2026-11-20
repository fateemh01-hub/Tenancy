import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/pin_controller.dart';

class PinScreen extends GetView<PinController> {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('enter_pin'.tr)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.lock_outline, size: 76),
                const SizedBox(height: 24),
                Text(
                  'enter_pin'.tr,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 10),
                Text('pin_hint'.tr, textAlign: TextAlign.center),
                const SizedBox(height: 28),
                Obx(
                  () => TextField(
                    controller: controller.pinController,
                    keyboardType: TextInputType.number,
                    obscureText: !controller.isPinVisible.value,
                    maxLength: 4,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                    ],
                    decoration: InputDecoration(
                      counterText: '',
                      hintText: '••••',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: controller.togglePinVisibility,
                        icon: Icon(
                          controller.isPinVisible.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                    ),
                    onSubmitted: (_) => controller.continueToHome(),
                  ),
                ),
                const SizedBox(height: 22),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: controller.continueToHome,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Text('continue'.tr),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
