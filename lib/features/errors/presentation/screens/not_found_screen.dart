import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.error_outline, size: 90, color: Colors.red),
              const SizedBox(height: 20),
              Text('404', style: Theme.of(context).textTheme.displayLarge),
              const SizedBox(height: 12),
              Text(
                'not_found'.tr,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  Get.offAllNamed(AppRoutes.home);
                },
                child: Text('back_home'.tr),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
