import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/services.dart';

class AppInitializer {
  static Future<void> initialize() async {
    await initializeDateFormatting(); // Inicializa fechas en distintos idiomas
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp]); // Bloquea orientación vertical
  }
}
