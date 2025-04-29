import 'package:flutter_simply_design_system/flutter_simply_design_system.dart';
import 'package:mosi2/ui_basics.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController appearController;
  late final Animation<double> appearAnimation;

  @override
  void initState() {
    super.initState();
    appearController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();

    appearAnimation = CurvedAnimation(
      parent: appearController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    appearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Scaffold(
      backgroundColor: colors.surface,
      body: FadeTransition(
        opacity: appearAnimation,
        child: ScaleTransition(
          scale: appearAnimation,
          child: Center(
            child: Text(
              "Bienvenido a Onboarding 👋",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ),
    );
  }
}
