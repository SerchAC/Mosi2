import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvLoader {
  static Future<void> loadEnv() async {
    await dotenv.load();
  }

  static String get(String key, {String defaultValue = ''}) {
    return dotenv.env[key] ?? defaultValue;
  }
}
