import 'dart:math';

import 'package:calculator/constants/colors.dart';
import 'package:flutter/material.dart';

class HalfCircularProgressBar extends StatelessWidget {
  final double progress;

  const HalfCircularProgressBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.0,
      height: 75.0,
      child: CustomPaint(
        painter: HalfCircularProgressBarPainter(progress),
      ),
    );
  }
}

class HalfCircularProgressBarPainter extends CustomPainter {
  final double progress;

  HalfCircularProgressBarPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = mainColor
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;

    final Paint grayPaint = Paint()
      ..color = Colors.grey.shade300 // Set the gray color
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 10.0
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height;
    final double radius = size.width / 2;

    const double startAngle = pi; // 180 degrees in radians
    final double sweepAngle = pi * progress;

    // Draw the gray arc for the remaining part
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      startAngle + sweepAngle,
      pi - sweepAngle,
      false,
      grayPaint,
    );

    // Draw the main color arc for the progress
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

const Color mainColor2 = mainColor;
