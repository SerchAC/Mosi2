import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Modelo de usuario
class User {
  final String id;
  final String name;
  final String email;
  final String profilePic;

  User({required this.id, required this.name, required this.email, this.profilePic = ''});
}

/// Estado del usuario autenticado
class UserState {
  final User? user;

  UserState({this.user});

  UserState copyWith({User? user}) {
    return UserState(user: user ?? this.user);
  }
}

/// Proveedor de estado del usuario autenticado
final userStateProvider = StateProvider<UserState>((ref) {
  return UserState();
});