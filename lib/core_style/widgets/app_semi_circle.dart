import 'package:flutter/material.dart';

class MySemiCircle extends StatelessWidget {
  final double height;
  final Color color;

  const MySemiCircle({
    Key? key,
    required this.height,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _SemiCirclePainter(height, color),
        size: Size(double.infinity, height),
      );
}

class _SemiCirclePainter extends CustomPainter {
  final double height;
  final Color color;

  _SemiCirclePainter(this.height, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    final radius = rect.height / 2;
    final center = Offset(rect.center.dx, rect.center.dy + radius);

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(_SemiCirclePainter oldDelegate) => oldDelegate.height != height || oldDelegate.color != color;
}
