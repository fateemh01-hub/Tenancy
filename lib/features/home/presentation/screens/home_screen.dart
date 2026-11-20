import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_name'.tr),
        actions: [
          IconButton(
            onPressed: controller.openSettings,
            icon: const Icon(Icons.settings),
            tooltip: 'settings'.tr,
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.check_circle_outline, size: 76),
                const SizedBox(height: 18),
                Text(
                  'welcome'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text('home_message'.tr, textAlign: TextAlign.center),
                const SizedBox(height: 28),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.settings),
                    title: Text('settings'.tr),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: controller.openSettings,
                  ),
                ),

                const SizedBox(height: 12),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.info_outline),
                    title: Text('about'.tr),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: controller.openAbout,
                  ),
                ),

                const SizedBox(height: 12),

                GetBuilder<HomeController>(
                  id: 'home_details',
                  builder: (homeController) {
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.visibility),
                        title: Text(
                          homeController.showDetails
                              ? 'Hide details'
                              : 'Show details',
                        ),
                        subtitle: homeController.showDetails
                            ? const Text(
                                'GetBuilder and update([id]) are working.',
                              )
                            : null,
                        onTap: homeController.toggleDetails,
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),

                OutlinedButton.icon(
                  onPressed: controller.backToPin,
                  icon: const Icon(Icons.lock_outline),
                  label: Text('logout'.tr),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
