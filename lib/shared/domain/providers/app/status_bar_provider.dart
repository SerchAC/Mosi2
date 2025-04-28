import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final statusBarStyleProvider =
    StateNotifierProvider<StatusBarStyleNotifier, SystemUiOverlayStyle?>(
  (ref) => StatusBarStyleNotifier(),
);

class StatusBarStyleNotifier extends StateNotifier<SystemUiOverlayStyle?> {
  StatusBarStyleNotifier() : super(null);

  void forceStyle(SystemUiOverlayStyle style) {
    state = style;
  }

  void clear() {
    state = null;
  }
}
