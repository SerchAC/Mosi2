import 'package:flutter_simply_design_system/router.dart';
import 'package:go_router/go_router.dart';
import 'package:mosi2/core/environment/env_config.dart';
import 'package:mosi2/features/page_not_found/presentation/screens/not_found_screen.dart';
import 'package:mosi2/routes/general_routes.dart';

class AppRouterConfig {
  static final GoRouter router = GoRouter(
    initialLocation:
        EnvConfig.instance.isDev ? '/flows-dev' : '/welcome-screen',
    navigatorKey: NavigationService.navigatorKey,
    errorBuilder: (_, state) => NotFoundScreen(goRouterState: state),
    routes: [
      ...GeneralRoutes
          .routes, // 👈 Carga las rutas que no pertenecen a ningun flujo
    ],
  );
}
