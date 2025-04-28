import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_simply_design_system/flutter_simply_design_system.dart';
import 'package:mosi2/core/environment/env_config.dart';
import 'package:mosi2/core/observables/settings_state.dart';
import 'package:mosi2/testing/app_router_testing.dart';
import 'package:mosi2/ui_basics.dart';

void main() => mainCommonTesting(AppEnvironment.staging);

Future<void> mainCommonTesting(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Future.wait([
      dotenv.load(fileName: '.env'),
      initializeDateFormatting('es_MX', null),
      StorageManager.init(),
    ]);
  } catch (e) {
    LogService.error("❌ Error en la inicialización: $e");
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
    LogService.error("❌ Error al establecer la orientación: $e");
  }

  runApp(ProviderScope(
    observers: [ProviderLogger()],
    child: const MyAppTesting(),
  ));
}

class MyAppTesting extends ConsumerStatefulWidget {
  const MyAppTesting({super.key});

  @override
  ConsumerState<MyAppTesting> createState() => _MyAppTestingState();
}

class _MyAppTestingState extends ConsumerState<MyAppTesting> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(settingsStateProvider).themeMode;
    return MaterialApp.router(
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: themeMode,
      routerConfig: AppRouterTestingConfig.router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('es')],
    );
  }
}
