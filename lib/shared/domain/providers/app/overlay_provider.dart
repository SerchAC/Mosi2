import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../application/overlay/overlay_manager.dart';
import '../../../domain/overlay/overlay_state.dart';

final overlayProvider =
    StateNotifierProvider<OverlayManager, OverlayStateModel>(
  (ref) => OverlayManager(),
);
