import 'dart:math';

import 'package:flutter_simply_design_system/flutter_simply_design_system.dart';
import 'package:lottie/lottie.dart';
import 'package:mosi2/routes/general_constants.dart';
import 'package:mosi2/shared/domain/providers/app/status_bar_provider.dart';
import 'package:mosi2/shared/widgets/clipers/circle_clipper.dart';
import 'package:mosi2/ui_basics.dart';

/// Pantalla de Splash inicial con animación Lottie, gradiente de fondo y transición circular.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController lottieController;
  late final AnimationController exitController;
  late final Animation<double> circleAnimation;
  late final Animation<double> exitAnimation;

  @override
  void initState() {
    super.initState();

    // Configura el estilo de la status bar al entrar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(statusBarStyleProvider.notifier).forceStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark,
            ),
          );
    });

    // Controlador de la animación Lottie
    lottieController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2800),
    )..forward();

    // Controlador de la animación de salida circular
    exitController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    // Animaciones curvas para transiciones suaves
    circleAnimation = CurvedAnimation(
      parent: exitController,
      curve: Curves.easeInOut,
    );
    exitAnimation = CurvedAnimation(
      parent: exitController,
      curve: Curves.easeInOut,
    );

    // Escucha cuando la animación Lottie termine
    lottieController.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        await exitController.forward(); // Inicia transición de salida
        if (!mounted) return;
        NavigationService.goTo(
            GeneralConstants.onBoarding); // Navega al OnBoarding
      }
    });
  }

  @override
  void dispose() {
    lottieController.dispose();
    exitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = context.responsive;
    final maxRadius = sqrt(responsive.width * responsive.width +
        responsive.height * responsive.height);

    return Scaffold(
      body: Stack(
        children: [
          // Fondo con gradiente y recorte circular animado
          AnimatedBuilder(
            animation: circleAnimation,
            builder: (context, child) {
              return ClipPath(
                clipper: CircleClipper(
                  progress: circleAnimation.value,
                  maxRadius: maxRadius,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xFF7E37C4),
                        Color(0xFF8A42D1),
                        Color(0xFFB166FB),
                      ],
                      stops: [0.0, 0.4852, 1.0],
                    ),
                  ),
                ),
              );
            },
          ),
          // Lottie animado con salida fade + scale
          Center(
            child: FadeTransition(
              opacity:
                  Tween<double>(begin: 1.0, end: 0.0).animate(exitAnimation),
              child: ScaleTransition(
                scale:
                    Tween<double>(begin: 1.0, end: 0.8).animate(exitAnimation),
                child: Lottie.asset(
                  'assets/animations/splash_art.json',
                  repeat: false,
                  controller: lottieController,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
