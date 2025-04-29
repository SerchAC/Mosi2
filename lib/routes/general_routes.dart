import 'package:go_router/go_router.dart';
import 'package:mosi2/features/onboarding/presentation/screens/onboarding.dart';
import 'package:mosi2/features/splash/presentation/screens/splash_screen.dart';
import 'package:mosi2/routes/general_constants.dart';
import 'package:mosi2/ui_basics.dart';

class GeneralRoutes {
  static List<GoRoute> get routes => [
        GoRoute(
          path: '/',
          name: GeneralConstants.splash,
          builder: (_, __) => SplashScreen(),
        ),
        GoRoute(
          path: '/onboarding',
          name: GeneralConstants.onBoarding,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const OnboardingScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
      ];
}
