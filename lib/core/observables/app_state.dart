import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Estado global de la aplicación
class AppState {
  final bool isDarkMode;
  final bool isConnected;

  AppState({this.isDarkMode = false, this.isConnected = true});

  AppState copyWith({bool? isDarkMode, bool? isConnected}) {
    return AppState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isConnected: isConnected ?? this.isConnected,
    );
  }
}

/// Proveedor de estado global de la app
final appStateProvider = StateProvider<AppState>((ref) {
  return AppState();
});