import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simply_design_system/storage.dart';

/// Clave usada para almacenar la preferencia en el dispositivo.
const String _biometricKey = "biometric_enabled";

/// 🔹 Notifier para manejar el estado de la preferencia de biométricos.
class BiometricNotifier extends StateNotifier<bool> {
  BiometricNotifier() : super(false) {
    _loadBiometricPreference();
  }

  /// Carga la preferencia de biométricos desde el almacenamiento local.
  Future<void> _loadBiometricPreference() async {
    final storedValue = await StorageManager.get(false, _biometricKey);
    state = storedValue == "true";
  }

  /// 🔹 Habilita los biométricos y guarda la preferencia.
  Future<void> enableBiometrics() async {
    state = true;
    await StorageManager.set(false, _biometricKey, "true");
  }

  /// 🔹 Deshabilita los biométricos y guarda la preferencia.
  Future<void> disableBiometrics() async {
    state = false;
    await StorageManager.set(false, _biometricKey, "false");
  }
}

/// Provider global para la preferencia de biométricos.
final biometricProvider = StateNotifierProvider<BiometricNotifier, bool>(
  (ref) => BiometricNotifier(),
);
