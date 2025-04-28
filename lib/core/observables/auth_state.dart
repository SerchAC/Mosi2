import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Estado de autenticación
class AuthState {
  final bool isAuthenticated;
  final String? userId;
  final String? token;

  AuthState({this.isAuthenticated = false, this.userId, this.token});

  AuthState copyWith({bool? isAuthenticated, String? userId, String? token}) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      userId: userId ?? this.userId,
      token: token ?? this.token,
    );
  }
}

/// Proveedor de estado de autenticación
final authStateProvider = StateProvider<AuthState>((ref) {
  return AuthState();
});