import 'package:mosi2/core/configs/app_configs.dart';
import 'package:mosi2/core/environment/env_loader.dart';

enum AppEnvironment { dev, staging, prod }

extension AppEnvironmentX on AppEnvironment {
  String get name => toString().split('.').last.toUpperCase();
}

class EnvConfig {
  final AppEnvironment environment;
  final String baseUrl;
  final bool isProduction;
  final bool isDev;
  final String chatProjectId;
  final String chatAgentLocation;
  final String chatAgentID;

  static EnvConfig? _instance;

  EnvConfig._internal({
    required this.environment,
    required this.baseUrl,
    required this.isProduction,
    required this.isDev,
    required this.chatProjectId,
    required this.chatAgentLocation,
    required this.chatAgentID,
  });

  static Future<void> init(AppEnvironment env) async {
    await EnvLoader.loadEnv(); // Carga el .env si está disponible

    _instance = EnvConfig._internal(
      environment: env,
      baseUrl: _getBaseUrl(env),
      isProduction: env == AppEnvironment.prod,
      isDev: env == AppEnvironment.dev,
      chatProjectId: EnvLoader.get('CHAT_PROJECT_ID',
          defaultValue: 'chatbotprueba-412722'),
      chatAgentLocation:
          EnvLoader.get('CHAT_AGENT_LOCATION', defaultValue: 'us-west1'),
      chatAgentID: EnvLoader.get('CHAT_AGENT_ID',
          defaultValue: '6dc43ed1-5aa8-45cf-85ff-476e9308193c'),
    );
  }

  static EnvConfig get instance {
    if (_instance == null) {
      throw Exception(
          'EnvConfig no ha sido inicializado. Llama a init() antes de usarlo.');
    }
    return _instance!;
  }

  static String _getBaseUrl(AppEnvironment env) {
    switch (env) {
      case AppEnvironment.staging:
        return AppConfigs.apiUrlStage;
      case AppEnvironment.prod:
        return AppConfigs.apiUrlProd;
      default:
        return 'https://dev.yapsi.com/api';
    }
  }
}

/// Estructura de configuracion de los ambientes
///
/// 🔹 **Ejemplo de uso:**
/// ```dart
/// EnvConfig.init(AppEnvironment.dev);
/// ```
/// ```dart
/// EnvConfig.instance.chatProjectId
/// ```
