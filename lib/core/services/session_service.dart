import 'package:get/get.dart';
import 'storage_service.dart';

class SessionService extends GetxService {
  SessionService({required StorageService storage}) : _storage = storage;
  final StorageService _storage;
  static const String _pinConfiguredKey = 'pin_configured';
  static const String _pinKey = 'user_pin';
  bool _isAuthenticated = false;
  bool _isPinConfigured = false;
  bool get isAuthenticated => _isAuthenticated;
  bool get isPinConfigured => _isPinConfigured;
  Future<SessionService> init() async {
    _isPinConfigured = _storage.read<bool>(_pinConfiguredKey) ?? false;
    _isAuthenticated = false;
    return this;
  }

  Future<void> configurePin(String pin) async {
    await _storage.write(_pinKey, pin);
    await _storage.write(_pinConfiguredKey, true);
    _isPinConfigured = true;
  }

  bool verifyPin(String pin) {
    return _storage.read<String>(_pinKey) == pin;
  }

  void authenticate() {
    _isAuthenticated = true;
  }

  void endSession() {
    _isAuthenticated = false;
  }
}
