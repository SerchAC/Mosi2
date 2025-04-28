import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simply_design_system/flutter_simply_design_system.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:mosi2/shared/domain/providers/app/navbar_index_provider.dart';
import 'package:mosi2/shared/domain/providers/app/overlay_provider.dart';

class NavigationBarWidget extends ConsumerStatefulWidget {
  const NavigationBarWidget({super.key});

  @override
  ConsumerState<NavigationBarWidget> createState() =>
      _NavigationBarWidgetState();
}

class _NavigationBarWidgetState extends ConsumerState<NavigationBarWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late Animation<double> _indicatorPosition;

  final List<String> _routes = [
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _indicatorPosition = Tween<double>(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final responsive = context.responsive;
    final index = ref.watch(navbarIndexProvider);

    final slotWidths = [42.0, 42.0, 59.0, 42.0, 42.0];

    final totalWidth = responsive.width - 88;
    final totalSlotWidth = slotWidths.reduce((a, b) => a + b);

    final scale = totalWidth / totalSlotWidth;
    final scaledSlots = slotWidths.map((w) => w * scale).toList();

    final slotCenters = <double>[];
    double acc = 0;
    for (final w in scaledSlots) {
      slotCenters.add(acc + w / 2);
      acc += w;
    }

    if (index != 2) {
      final to = slotCenters[index];
      final from = _indicatorPosition.value;

      _indicatorPosition = Tween<double>(begin: from, end: to).animate(
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
      );
      _controller.forward(from: 0.0);
    }

    return SafeArea(
      top: false,
      child: Container(
        width: responsive.width,
        margin: EdgeInsets.only(
          bottom: responsive.spaceV(16),
          left: responsive.spaceH(16),
          right: responsive.spaceH(16),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 12.5,
        ),
        decoration: BoxDecoration(
          color: colors.surfaceContainerLowest,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacityFactor(0.2),
              blurRadius: 20,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(100),
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            if (index != 2)
              AnimatedBuilder(
                animation: _indicatorPosition,
                builder: (context, child) {
                  return Positioned(
                    top: 0,
                    left: _indicatorPosition.value - (40 / 2),
                    child: Container(
                      height: 4,
                      width: 40,
                      transform: Matrix4.translationValues(0, -14, 0),
                      decoration: BoxDecoration(
                        color: colors.secondary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  );
                },
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _NavbarItem(
                  icon: Symbols.home_rounded,
                  label: 'Inicio',
                  selected: index == 0,
                  onTap: () {
                    HapticFeedback.selectionClick();
                    ref.read(navbarIndexProvider.notifier).state = 0;
                    NavigationService.goTo(_routes[0]);
                  },
                ),
                _NavbarItem(
                  icon: Symbols.swap_vert_rounded,
                  label: 'Actividad',
                  selected: index == 1,
                  onTap: () {
                    HapticFeedback.selectionClick();
                    ref.read(navbarIndexProvider.notifier).state = 1;
                    NavigationService.goTo(_routes[1]);
                  },
                ),
                _CentralActionButton(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    ref.read(overlayProvider.notifier).hideNavbar();
                  },
                ),
                _NavbarItem(
                  icon: Symbols.brand_awareness_rounded,
                  label: 'Nuevas',
                  selected: index == 3,
                  onTap: () {
                    HapticFeedback.selectionClick();
                    ref.read(navbarIndexProvider.notifier).state = 3;
                    NavigationService.goTo(_routes[3]);
                  },
                ),
                _NavbarItem(
                  icon: Symbols.menu_rounded,
                  label: 'Más',
                  selected: index == 4,
                  onTap: () {
                    HapticFeedback.selectionClick();
                    ref.read(navbarIndexProvider.notifier).state = 4;
                    NavigationService.goTo(_routes[1]);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _NavbarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const _NavbarItem({
    required this.icon,
    required this.label,
    this.selected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color =
        selected ? colors.secondary : colors.onSurface.withOpacityFactor(.25);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 42,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SimplyIcon(
              icon: icon,
              colorIcon: color,
              iconSize: 32,
              fillIcon: selected,
            ),
            FittedBox(
              child: SimplyText(
                text: label,
                textStyle: AppTypography.bodyExtraSmall.copyWith(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CentralActionButton extends StatelessWidget {
  final VoidCallback? onTap;

  const _CentralActionButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 59,
        width: 59,
        transform: Matrix4.translationValues(
          0.0,
          -28,
          0.0,
        ),
        decoration: BoxDecoration(
          color: colors.tertiaryContainer,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: colors.surface, width: 3),
        ),
        child: SimplyIcon(
          icon: Symbols.qr_code_rounded,
          colorIcon: colors.onTertiaryContainer,
          iconSize: 32,
        ),
      ),
    );
  }
}
