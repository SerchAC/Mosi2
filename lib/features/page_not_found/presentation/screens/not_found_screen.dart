import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_simply_design_system/flutter_simply_design_system.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key, required this.goRouterState});

  final GoRouterState goRouterState;

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final colors = context.colors;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsive.spaceH(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 🔹 **Ilustración de error**
            BounceInDown(
              duration: Duration(milliseconds: 1000),
              child: ShakeX(
                delay: Duration(milliseconds: 1500),
                child: SvgPicture.asset(
                  'assets/illustrations/error_404.svg',
                  height: responsive.spaceV(200),
                ),
              ),
            ),
            const VerticalSpacing(space: 24),

            /// 🔹 **Mensaje amigable**
            FallingLettersText(
              text: "Parece que te perdiste.",
              style: AppTypography.titleLarge.copyWith(color: colors.onSurface),
              duration: Duration(milliseconds: 200),
            ),
            FallingLettersText(
              text: "No encontramos la página",
              style: AppTypography.titleLarge.copyWith(color: colors.primary),
              duration: Duration(milliseconds: 400),
            ),

            const VerticalSpacing(space: 8),

            /// 🔹 **Mensaje técnico del error (opcional)**
            FallingLettersText(
              text: goRouterState.error?.toString() ?? 'Error desconocido.',
              style: AppTypography.labelLarge.copyWith(
                color: colors.onSurfaceVariant.withOpacityFactor(0.6),
              ),
              duration: Duration(milliseconds: 800),
            ),

            const VerticalSpacing(space: 32),

            /// 🔹 **Botón para volver al inicio**
            FadeInDown(
              duration: Duration(milliseconds: 500),
              child: SimplyFilledButton(
                onPress: () => NavigationService.pushTo('/'),
                label: 'Volver al inicio',
                icon: Symbols.home_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
