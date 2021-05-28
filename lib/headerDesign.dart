import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HeaderDesign extends CustomPainter {

  final Color myColor1;
  final Color myColor2;

  HeaderDesign({ required this.myColor1, required this.myColor2, });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();


    // Path number 1

    var rect = Offset.zero & size;
    paint.shader = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        myColor2,
        myColor1,
      ],
    ).createShader(rect);
    path = Path();
    path.lineTo(0, 0);
    path.cubicTo(0, size.height * 0.66, 0, size.height, 0, size.height);
    path.cubicTo(0, size.height, size.width * 0.05, size.height * 0.65, size.width * 0.19, size.height * 0.65);
    path.cubicTo(size.width * 0.32, size.height * 0.65, size.width * 0.87, size.height * 0.65, size.width * 0.87, size.height * 0.65);
    path.cubicTo(size.width * 0.87, size.height * 0.65, size.width, size.height * 0.65, size.width, size.height * 0.53);
    path.cubicTo(size.width, size.height * 0.53, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, 0, 0, 0, 0);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}