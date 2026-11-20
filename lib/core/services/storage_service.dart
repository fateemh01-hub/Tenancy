import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// The only class in the app that talks directly to GetStorage.
class StorageService extends GetxService {
  late final GetStorage _storage;

  Future<StorageService> init() async {
    await GetStorage.init();
    _storage = GetStorage();
    return this;
  }

  T? read<T>(String key) => _storage.read<T>(key);

  Future<void> write(String key, dynamic value) async {
    await _storage.write(key, value);
  }

  Future<void> remove(String key) async {
    await _storage.remove(key);
  }

  bool hasData(String key) => _storage.hasData(key);
}
