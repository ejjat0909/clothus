import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

class SecureSharedPreferences {
  // Initialize object
  static final encryptedSharedPreferences = EncryptedSharedPreferences();

  // To read data from the shared preferences
  static Future<String> read({required String key}) async {
    return await encryptedSharedPreferences.getString(key);
  }

  // To write data from the shared preferences
  static Future write({required String key, required String value}) async {
    return await encryptedSharedPreferences.setString(key, value);
  }

  // To delete data from the shared preferences
  static Future delete({required String key}) async {
    return await encryptedSharedPreferences.remove(key);
  }
}
