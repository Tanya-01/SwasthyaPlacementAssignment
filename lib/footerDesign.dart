import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FooterDesign extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Colors.white;
    path = Path();
    path.lineTo(0, size.height * 0.79);
    path.cubicTo(0, size.height * 0.79, size.width * 0.02, size.height * 0.45, size.width / 5, size.height * 0.45);
    path.cubicTo(size.width / 5, size.height * 0.45, size.width * 0.76, size.height * 0.45, size.width * 0.76, size.height * 0.45);
    path.cubicTo(size.width * 0.76, size.height * 0.45, size.width * 0.93, size.height * 0.47, size.width * 0.96, size.height * 0.23);
    path.cubicTo(size.width, -0.01, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height, size.width, size.height);
    path.cubicTo(size.width, size.height, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, 0, size.height * 0.79, 0, size.height * 0.79);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}