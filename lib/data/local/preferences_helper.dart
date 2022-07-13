
import 'package:secure_notes_app/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tuple/tuple.dart';


// ignore: avoid_classes_with_only_static_members
class PreferencesHelper {

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future<T?> read<T>(TypeStoreKey<T> typedStoreKey) async => ((await prefs).get(typedStoreKey.key) as T?)
      ?? typedStoreKey.defaultValue;

  static Future<void> write<T>(TypeStoreKey<T> typedStoreKey, T? value) async {
    if (value == null) {
      await (await prefs).remove(typedStoreKey.key);

      return;
    }
    switch (T) {
      case int:
        await (await prefs).setInt(typedStoreKey.key, value as int);
        break;
      case String:
        await (await prefs).setString(typedStoreKey.key, value as String);
        break;
      case double:
        await (await prefs).setDouble(typedStoreKey.key, value as double);
        break;
      case bool:
        await (await prefs).setBool(typedStoreKey.key, value as bool);
        break;
      case List:
        await (await prefs).setStringList(typedStoreKey.key, value as List<String>);
        break;
    }
  }

  static Future<Tuple2<String?, String?>> getCredentials() async =>
      Tuple2(await _getString(_login), await _getString(_password));

  static Future<bool> setCredentials(String login, String password) async {
    await _setString(_login, login);
    return _setString(_password, password);
  }

  static Future<bool> clearCredentials() async {
    await _clear(_login);
    return _clear(_password);
  }

  static Future<String?> _getString(String key) async => (await prefs).getString(key);

  static Future<bool> _setString(String key, String value) async => (await prefs).setString(key, value);

  static Future<bool> _clear(String key) async => (await prefs).remove(key);

  static const _login = 'login';
  static const _password = 'password';

}


class PrefsKeys {
  static final authWithBiometric = TypeStoreKey<bool>('authwithbiometrics', defaultValue: false);
  static final language = TypeStoreKey<String>('language', defaultValue: AppConfig.defaultLanguageName);
}

/// Обьект типизированный ключ используемый в key-value хранилищах для более удобной работы с ними
/// [T] - тип хранимого значения
/// [key] - строковый ключ
/// [defaultValue] - значение по умолчанию
///
/// Хранилище может ограничивать типизацию [T], обычно оно ограничивается стандартными типами: [int], [double], [String], [bool].
class TypeStoreKey<T> {
  final type = T;

  final String key;
  final T? defaultValue;
  TypeStoreKey(
    this.key,{
    this.defaultValue
  });

  @override
  String toString() => 'TypeStoreKey(key: $key, defaultValue: $defaultValue)';
}