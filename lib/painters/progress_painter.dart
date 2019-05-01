import 'package:flutter/material.dart';
import 'dart:math';

class ProgressPainter extends CustomPainter {
  final Color defaultCircleColor;
  final Color percentageCompletedCircleColor;
  final double completedPercentage;
  final double circleWidth;

  ProgressPainter(
      {this.defaultCircleColor,
      this.percentageCompletedCircleColor,
      this.completedPercentage,
      this.circleWidth});

  getPaint(Color color) {
    return Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final rect = new Rect.fromLTWH(-30.0, 0.0, size.width, size.height);
    final gradient = new SweepGradient(
      startAngle: 3 * pi / 2,
      endAngle: 7 * pi / 2,
      tileMode: TileMode.repeated,
      colors: [Colors.green, Colors.orange, Colors.red],
    );

    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);
    Paint defaultCirclePaint = getPaint(defaultCircleColor);
    canvas.drawCircle(center, radius, defaultCirclePaint);
    double arcAngle = 2 * pi * (completedPercentage / 100);
    final startAngle = -pi / 2;
    final sweepAngle = 2 * pi * completedPercentage;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paint);

    //OLD
    //     Paint defaultCirclePaint = getPaint(defaultCircleColor);
    // Paint progressCirclePaint = getPaint(percentageCompletedCircleColor);

    // Offset center = Offset(size.width / 2, size.height / 2);
    // double radius = min(size.width / 2, size.height / 2);
    // canvas.drawCircle(center, radius, defaultCirclePaint);
    // double arcAngle = 2 * pi * (completedPercentage / 100);
    // canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
    //     arcAngle, false, progressCirclePaint);
  }

  @override
  bool shouldRepaint(CustomPainter painter) {
    return true;
  }
}
