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
    var color1 = Colors.green;
    var color2 = Colors.red;    
    var w2 = completedPercentage / 100;
    var w1 = 1 - w2;
    
    var finalColor = [
      (color1.red * w1 + color2.red * w2).round(),
      (color1.green * w1 + color2.green * w2).round(),
      (color1.blue * w1 + color2.blue * w2).round()
    ];
    final paint1 = getPaint(
        Color.fromRGBO(finalColor[0], finalColor[1], finalColor[2], 1));
    Paint defaultCirclePaint = getPaint(defaultCircleColor);
    //Paint progressCirclePaint = getPaint(percentageCompletedCircleColor);

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, defaultCirclePaint);
    double arcAngle = 2 * pi * (completedPercentage / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter painter) {
    return true;
  }
}
