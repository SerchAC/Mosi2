import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simply_design_system/flutter_simply_design_system.dart';
import 'package:go_router/go_router.dart';
import 'package:mosi2/core/app/app_initializer.dart';
import 'package:mosi2/core/navigation/app_router.dart';
import 'package:mosi2/core/observables/settings_state.dart';
import 'package:mosi2/shared/widgets/templates/global_overlay_widget.dart';
import 'package:mosi2/shared/widgets/wrapers/themed_status_wrapper.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    AppInitializer.initialize();
    AppRouterConfig.router.routerDelegate.addListener(_logRouteStack);
  }

  void _logRouteStack() {
    final matchList =
        AppRouterConfig.router.routerDelegate.currentConfiguration;
    LogService.trace('🧭 Stack actual (reconstruido):');

    // Acumulador de la ruta completa
    String fullPath = '';

    for (final match in matchList.matches) {
      final route = match.route;
      final segment = match.matchedLocation;

      fullPath += segment;

      if (route is GoRoute) {
        final name = route.name ?? 'sin nombre';
        LogService.trace('→ $name ($fullPath)');
      } else {
        LogService.trace(
            '→ (Tipo desconocido: ${route.runtimeType}) → $fullPath');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(settingsStateProvider).themeMode;

    return MaterialApp.router(
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: themeMode,
      routerConfig: AppRouterConfig.router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('es')],
      builder: (context, child) {
        return Stack(
          children: [
            child!,
            ThemedStatusWrapper(child: GlobalOverlayWidget()),
          ],
        );
      },
    );
  }
}
