import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simply_design_system/router/navigation_service.dart';
import 'package:mosi2/shared/application/overlay/navbar/navigation_bar_widget.dart';

class NavbarOverlayController extends StateNotifier<OverlayEntry?> {
  NavbarOverlayController() : super(null);

  late final AnimationController _animationController = AnimationController(
    vsync: NavigationService.navigatorKey.currentState! as TickerProvider,
    duration: const Duration(milliseconds: 300),
  );

  void show(BuildContext context) {
    if (state != null) return;

    final entry = OverlayEntry(
      builder: (_) => AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Positioned(
            left: 0,
            right: 0,
            bottom: -100 + (_animationController.value * 100),
            child: const NavigationBarWidget(),
          );
        },
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(entry);
    state = entry;
    _animationController.forward(from: 0);
  }

  Future<void> hide() async {
    await _animationController.reverse();
    state?.remove();
    state = null;
  }

  void toggle(BuildContext context) => state == null ? show(context) : hide();
}

final navbarOverlayProvider =
    StateNotifierProvider<NavbarOverlayController, OverlayEntry?>(
        (ref) => NavbarOverlayController());
