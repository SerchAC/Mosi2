import 'package:local_auth/local_auth.dart';
import 'package:mosi2/shared/domain/providers/app/biometric_provider.dart';
import 'package:mosi2/ui_basics.dart';

Future authBiometric(WidgetRef ref) async {
  // Activa la autenticación local (FaceID, TouchID, PIN, etc.)
  final LocalAuthentication auth = LocalAuthentication();
  final List<BiometricType> availableBiometrics =
      await auth.getAvailableBiometrics();

  if (availableBiometrics.isNotEmpty) {
    try {
      final bool didAuthenticate = await auth.authenticate(
          localizedReason:
              'Utiliza el método de desbloqueo de tu móvil para iniciar sesión');

      if (didAuthenticate) {
        // 🔹 Guarda la preferencia en el dispositivo
        ref.read(biometricProvider.notifier).enableBiometrics();
        // NavigationService.goTo(OpenAccountConstants.phoneVerification);
      }
    } catch (e) {
      // Manejo de errores en la autenticación
    }
  } else {
    // Si no hay autenticación disponible, omite la configuración de biométricos
    // NavigationService.goTo(OpenAccountConstants.phoneVerification);
  }
}
