import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:mosi2/shared/domain/providers/app/status_bar_provider.dart';

class ThemedStatusWrapper extends ConsumerWidget {
  const ThemedStatusWrapper({
    super.key,
    required this.child,
    this.transparent = true,
  });

  final Widget child;
  final bool transparent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forcedStyle = ref.watch(statusBarStyleProvider);

    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    final defaultStyle = SystemUiOverlayStyle(
      statusBarColor: transparent
          ? Colors.transparent
          : Theme.of(context).scaffoldBackgroundColor,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: forcedStyle ?? defaultStyle,
      child: child,
    );
  }
}
