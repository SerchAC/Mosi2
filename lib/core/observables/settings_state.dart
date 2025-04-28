import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

/// Estado de configuración (tema e idioma)
class SettingsState {
  final Locale locale;
  final ThemeMode themeMode;

  SettingsState(
      {this.locale = const Locale('es'), this.themeMode = ThemeMode.system});

  SettingsState copyWith({Locale? locale, ThemeMode? themeMode}) {
    return SettingsState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}

/// Proveedor de estado de configuración
final settingsStateProvider = StateProvider<SettingsState>((ref) {
  return SettingsState();
});
