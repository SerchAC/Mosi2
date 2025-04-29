import 'package:mosi2/ui_basics.dart';

class CircleClipper extends CustomClipper<Path> {
  final double progress;
  final double maxRadius;

  CircleClipper({required this.progress, required this.maxRadius});

  @override
  Path getClip(Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = maxRadius * (1.0 - progress);

    path.addOval(Rect.fromCircle(center: center, radius: radius));
    return path;
  }

  @override
  bool shouldReclip(covariant CircleClipper oldClipper) {
    return oldClipper.progress != progress;
  }
}
