import 'package:screen_brightness/screen_brightness.dart';

class BrightnessUtils {
  static Future<void> setMaxBrightness() async {
    try {
      await ScreenBrightness().setApplicationScreenBrightness(1.0);
    } catch (_) {}
  }

  static Future<void> reset() async {
    await ScreenBrightness().resetApplicationScreenBrightness();
  }
}
