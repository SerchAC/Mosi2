import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mosi2/shared/application/overlay/navbar/navigation_bar_widget.dart';
import 'package:mosi2/shared/domain/providers/app/overlay_provider.dart';

class GlobalOverlayWidget extends ConsumerWidget {
  const GlobalOverlayWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final overlay = ref.watch(overlayProvider);

    return IgnorePointer(
      ignoring: overlay.modal == null &&
          !overlay.showEntering &&
          !overlay.showExiting &&
          !overlay.isNavbarVisible,
      child: Stack(
        children: [
          AnimatedSlide(
            offset: overlay.isNavbarVisible ? Offset.zero : const Offset(0, 1),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: NavigationBarWidget(),
            ),
          ),
          if (overlay.modal != null) overlay.modal!,
        ],
      ),
    );
  }
}
