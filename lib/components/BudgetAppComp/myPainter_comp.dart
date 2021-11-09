import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  MyPainter(this.sweepAngle, this.color);
  final double? sweepAngle;
  final Color? color;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 15.0 // 1.
      ..style = PaintingStyle.stroke // 2.
      ..color = color!; // 3.

    double degToRad(double deg) => deg * (3.14 / 180.0);

    final path = Path()
      ..arcTo(
          // 4.
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * 0.8,
            width: size.width * 0.8,
          ), // 5.
          degToRad(120), // 6.
          degToRad(sweepAngle!), // 7.
          false);

    canvas.drawPath(path, paint); // 8.
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class MySecondaryPainter extends CustomPainter {
  MySecondaryPainter(this.sweepAngle, this.color);
  final double? sweepAngle;
  final Color? color;
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 15.0 // 1.
      ..style = PaintingStyle.stroke // 2.
      ..color = color!; // 3.

    double degToRad(double deg) => deg * (3.14 / 180.0);

    final path = Path()
      ..arcTo(
          // 4.
          Rect.fromCenter(
            center: Offset(size.height / 2, size.width / 2),
            height: size.height * 0.8,
            width: size.width * 0.8,
          ), // 5.
          degToRad(120), // 6.
          degToRad(360), // 7.
          false);

    canvas.drawPath(path, paint); // 8.
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
