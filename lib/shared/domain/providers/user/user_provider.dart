import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosi2/shared/domain/models/user/user.dart';
import 'package:mosi2/shared/domain/providers/user/user_notifier.dart';

/// 🔥 **Provider de `UserNotifier` para gestionar el usuario globalmente**
final userNotifierProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(),
);
