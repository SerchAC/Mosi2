import 'package:equatable/equatable.dart';

class PreUserWallet extends Equatable {
  final String nickName;
  final String device;
  final String phoneNumber;
  final String email;

  const PreUserWallet({
    this.nickName = '',
    this.device = '',
    this.phoneNumber = '',
    this.email = '',
  });

  @override
  List<Object?> get props => [
        nickName,
        device,
        phoneNumber,
        email,
      ];

  /// 🔹 Crea una copia del objeto con valores modificados.
  PreUserWallet copyWith({
    String? nickName,
    String? device,
    String? phoneNumber,
    String? email,
  }) {
    return PreUserWallet(
      nickName: nickName ?? this.nickName,
      device: device ?? this.device,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
    );
  }

  /// 🔹 Formato más claro para imprimir datos del usuario.
  @override
  String toString() {
    return '''
==================== 📄 PreUser ====================
👤 NickName: $nickName
📱 Device: $device
☎ PhoneNumber: $phoneNumber
📧 Email: $email 
======================================================
''';
  }
}
