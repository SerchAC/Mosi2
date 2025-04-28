import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Función auxiliar para construir rutas más limpias y modulares
GoRoute buildRoute(
  String path,
  String name,
  Widget screen, {
  List<GoRoute>? subroutes,
  RouteTransitionsBuilder? transitionsBuilder,
}) {
  return GoRoute(
    path: path,
    name: name,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: screen,
      transitionsBuilder: transitionsBuilder ??
          (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(
                scale: Tween<double>(begin: 0.95, end: 1.0).animate(animation),
                child: child,
              ),
            );
          },
    ),
    routes: subroutes ?? [],
  );
}

Widget costumeTransition(Animation<double> animation, Widget child) {
  return FadeTransition(
    opacity: animation,
    child: ScaleTransition(
      scale: Tween<double>(begin: 0.95, end: 1.0).animate(animation),
      child: child,
    ),
  );
}
