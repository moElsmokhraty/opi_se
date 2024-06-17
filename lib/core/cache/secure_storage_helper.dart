import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final storage = FlutterSecureStorage(
    iOptions: getIOSOptions(),
    aOptions: getAndroidOptions(),
  );

  static IOSOptions getIOSOptions() => const IOSOptions();

  static AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  static Future<void> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      await storage.write(
        key: key,
        value: '$value|${value.runtimeType}',
      );
    } else if (value is bool) {
      await storage.write(
        key: key,
        value:
            value == true ? '1|${value.runtimeType}' : '0|${value.runtimeType}',
      );
    } else if (value is int) {
      await storage.write(
        key: key,
        value: '$value|${value.runtimeType}',
      );
    } else if (value is double) {
      await storage.write(
        key: key,
        value: '$value|${value.runtimeType}',
      );
    }
  }

  static Future<dynamic> getData({required String key}) async {
    String? valueRead = await storage.read(key: key);
    if (valueRead != null) {
      String? value;
      List<String> splitValues = valueRead.split('|');
      value = valueRead.split('|')[0];
      switch (splitValues[splitValues.length - 1]) {
        case 'String':
          return value;
        case 'bool':
          return value == '1' ? true : false;
        case 'int':
          return int.parse(value);
        case 'double':
          return double.parse(value);
      }
    }
  }

  static Future<void> removeData({required String key}) async {
    return await storage.delete(key: key);
  }

  static Future<void> removeAllData() async {
    return await storage.deleteAll();
  }
}
