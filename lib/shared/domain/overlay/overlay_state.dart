import 'package:flutter/material.dart';

class OverlayStateModel {
  final Widget? modal;
  final bool showEntering;
  final bool showExiting;
  final VoidCallback? onEnteringComplete;
  final VoidCallback? onExitingComplete;
  final bool isFloatingModal;
  final bool isNavbarVisible;

  const OverlayStateModel(
      {this.modal,
      this.showEntering = false,
      this.showExiting = false,
      this.onEnteringComplete,
      this.onExitingComplete,
      this.isFloatingModal = false,
      this.isNavbarVisible = false});

  OverlayStateModel copyWith({
    Widget? modal,
    bool? showEntering,
    bool? showExiting,
    VoidCallback? onEnteringComplete,
    VoidCallback? onExitingComplete,
    bool? isFloatingModal,
    bool? isNavbarVisible,
  }) {
    return OverlayStateModel(
      modal: modal ?? this.modal,
      showEntering: showEntering ?? this.showEntering,
      showExiting: showExiting ?? this.showExiting,
      onEnteringComplete: onEnteringComplete ?? this.onEnteringComplete,
      onExitingComplete: onExitingComplete ?? this.onExitingComplete,
      isFloatingModal: isFloatingModal ?? this.isFloatingModal,
      isNavbarVisible: isNavbarVisible ?? this.isNavbarVisible,
    );
  }

  static const empty = OverlayStateModel();
}
