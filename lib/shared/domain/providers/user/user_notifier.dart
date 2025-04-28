import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosi2/shared/domain/models/user/user.dart';
import 'package:flutter_simply_design_system/flutter_simply_design_system.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier() : super(const User()) {
    _loadUser();
  }

  /// 🔥 Carga el usuario almacenado en **SecureStorage** o **SharedPrefs**
  Future<void> _loadUser() async {
    final storedUser = await StorageManager.get(true, 'user_data');
    if (storedUser != null) {
      try {
        final Map<String, dynamic> userData = jsonDecode(storedUser);
        state = User.fromJson(userData);
      } catch (e) {
        LogService.error("❌ Error al cargar el usuario: $e");
      }
    }
  }

  /// 🔥 Guarda el usuario en el estado y almacenamiento persistente
  Future<void> setUser(User user) async {
    state = user;
  }

  /// 🔥 Elimina la sesión del usuario
  Future<void> clearUser() async {
    state = const User();
  }
}
