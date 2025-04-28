import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Idioma predeterminado de la aplicación
final localeProvider = StateProvider<Locale>((ref) {
  return const Locale('es'); // Español como predeterminado
});

// Función para cambiar el idioma en tiempo de ejecución
void changeLanguage(WidgetRef ref, String langCode) {
  ref.read(localeProvider.notifier).state = Locale(langCode);
}
