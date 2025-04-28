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
            SvgPicture.asset(
              'assets/illustrations/error_404.svg',
              height: responsive.spaceV(200),
            ),
            const VerticalSpacing(space: 24),

            /// 🔹 **Mensaje amigable**
            TextBiColor(
              text1Normal: 'Parece que te perdiste. ',
              text2Color: 'No encontramos la página 😢',
            ),
            const VerticalSpacing(space: 8),

            /// 🔹 **Mensaje técnico del error (opcional)**
            SimplyText(
              text: goRouterState.error?.toString() ?? 'Error desconocido.',
              textStyle: AppTypography.labelLarge.copyWith(
                color: colors.onSurfaceVariant.withOpacityFactor(0.6),
              ),
              textAlign: TextAlign.center,
            ),
            const VerticalSpacing(space: 32),

            /// 🔹 **Botón para volver al inicio**
            SimplyFilledButton(
              onPress: () => NavigationService.pushTo('/'),
              label: 'Volver al inicio',
              icon: Symbols.home_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
