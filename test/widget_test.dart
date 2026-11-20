import 'package:ftoom/core/services/session_service.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:ftoom/app.dart';
import 'package:ftoom/core/services/storage_service.dart';
import 'package:ftoom/routes/initial_binding.dart';

const MethodChannel pathProviderChannel = MethodChannel(
  'plugins.flutter.io/path_provider',
);
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setUpAll(() async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(pathProviderChannel, (call) async {
          if (call.method == 'getApplicationDocumentsDirectory') {
            return Directory.systemTemp.path;
          }
          return null;
        });
    final storageService = await StorageService().init();
    Get.put<StorageService>(storageService, permanent: true);
    final sessionService = await SessionService(storage: storageService).init();
    Get.put<SessionService>(sessionService, permanent: true);
  });
  testWidgets('StarterApp builds successfully', (tester) async {
    InitialBinding().dependencies();
    await tester.pumpWidget(const StarterApp());
    expect(find.byType(StarterApp), findsOneWidget);
    // Finish the splash delay and its navigation transition.
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
  });
}
