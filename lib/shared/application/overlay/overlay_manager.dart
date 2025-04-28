import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simply_design_system/widgets/modals/floating_drawable_modal.dart';
import 'package:mosi2/shared/domain/overlay/overlay_state.dart';

class OverlayManager extends StateNotifier<OverlayStateModel> {
  OverlayManager() : super(OverlayStateModel.empty);

  void showModal(Widget modal, {bool isFloating = true}) {
    state = state.copyWith(
      modal: modal,
      isFloatingModal: isFloating,
    );
  }

  Future<void> hideModal() async {
    if (state.isFloatingModal) {
      await FloatingDrawableModal.closeAnimated();
    }

    state = OverlayStateModel.empty;
  }

  void triggerEntering(VoidCallback? onComplete) {
    state = state.copyWith(
      showEntering: true,
      onEnteringComplete: onComplete,
    );
  }

  void triggerExiting(VoidCallback? onComplete) {
    state = state.copyWith(
      showExiting: true,
      onExitingComplete: onComplete,
    );
  }

  void completeEntering() {
    state.onEnteringComplete?.call();
    state = state.copyWith(showEntering: false, onEnteringComplete: null);
  }

  void completeExiting() {
    state.onExitingComplete?.call();
    state = state.copyWith(showExiting: false, onExitingComplete: null);
  }

  void showNavbar() {
    state = state.copyWith(isNavbarVisible: true);
  }

  void hideNavbar() {
    state = state.copyWith(isNavbarVisible: false);
  }
}
