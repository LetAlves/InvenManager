import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  const SecureStorage(); // Singleton

  final _secureStorage = const FlutterSecureStorage();

  Future<void> write({
    required String key,
    String? value,
  }) async {
    await _secureStorage.write(
      key: key,
      value: value,
    );
  }

  Future<String?> read({
    required String key,
  }) async {
    return await _secureStorage.read(
      key: key,
    );
  }

  Future<Map<String, String>> readAll() async {
    return await _secureStorage.readAll();
  }

  Future<void> delete({
    required String key,
  }) async {
    await _secureStorage.delete(
      key: key,
    );
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }
}
