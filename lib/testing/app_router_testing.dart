import 'package:flutter_simply_design_system/flutter_simply_design_system.dart';
import 'package:go_router/go_router.dart';

class AppRouterTestingConfig {
  static final GoRouter router = GoRouter(
    initialLocation: '/selector',
    navigatorKey: NavigationService.navigatorKey,
    routes: [],
  );
}
