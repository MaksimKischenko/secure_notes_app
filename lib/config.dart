
// ignore: avoid_classes_with_only_static_members
import 'package:secure_notes_app/utils/utils.dart';

class AppConfig {
  static const String appName = 'Secure notes app';
  static String passwordCrypter(String value) => value.toSha256();
  static const defaultLanguageName = 'ru';
}