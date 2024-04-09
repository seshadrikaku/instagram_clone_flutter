import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageData {
  final storage = const FlutterSecureStorage();

  Future<void> save(String key, dynamic value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    String? result = await storage.read(key: key);
    return result;
  }

  void deleteAll() {
    storage.deleteAll();
  }
}
