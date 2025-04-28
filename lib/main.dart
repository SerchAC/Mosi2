import 'package:mosi2/core_basics.dart';
import 'package:mosi2/shared/tokens/colors.dart';
import 'package:mosi2/ui_basics.dart';
import 'package:flutter_simply_design_system/flutter_simply_design_system.dart';

void main() => mainCommon(AppEnvironment.prod);

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Future.wait([
      dotenv.load(fileName: '.env'),
      initializeDateFormatting('es_MX', null),
      StorageManager.init(),
    ]);
  } catch (e) {
    LogService.fatal("❌ Error en la inicialización: $e");
  }

  try {
    AppTheme().setColorSchemes(
      lightScheme: AppColors.lightColorScheme,
      darkScheme: AppColors.darkColorScheme,
    );
  } catch (e) {
    LogService.fatal("❌ Error en la inicialización de Simply Now: $e");
  }

  EnvConfig.init(environment);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ),
  );

  try {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
    ]);
  } catch (e) {
    LogService.info("❌ Error al establecer la orientación: $e");
  }

  // 🔹 Forzar modo edge-to-edge para transparencia total
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(ProviderScope(
    observers: [ProviderLogger()],
    child: const MyApp(),
  ));
}
