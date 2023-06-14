import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class LevelPage extends StatefulWidget {
  const LevelPage({super.key});

  @override
  State<LevelPage> createState() => _LevelPageState();
}

class _LevelPageState extends State<LevelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: CustomPaint(
            painter: FlipBookPainter(),
            child: Container(
              height: double.infinity,
              width: double.infinity,
            ),
          ),
        ));
  }
}

class FlipBookPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paintDisabled = Paint()
      ..color = Color(0xFFE8EAED)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    final paintEnabled = Paint()
      ..color = Color(0xFF2060FE)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    List<int> levels = [1, 2, 3, 3, 4, 4, 5, 5, 5, 5];

    for (int i = 0; i < levels.length; i++) {
      double dx = i % 2 == 0 ? 300 : 229;
      double dy = 200 + (i * 70);
      double startAngle = 0;
      double sweepAngle = pi * 3 / 4;

      if (i == 0) {
        canvas.drawArc(
            Rect.fromCenter(center: Offset(dx, dy), width: 100, height: 100),
            startAngle,
            sweepAngle,
            false,
            i < 3 ? paintEnabled : paintDisabled);
      } else {
        startAngle = i % 2 == 0 ? pi * 5 / 4 : pi * 3;

        canvas.drawArc(
            Rect.fromCenter(center: Offset(dx, dy), width: 100, height: 100),
            startAngle,
            sweepAngle,
            false,
            i < 3 ? paintEnabled : paintDisabled);
        canvas.drawArc(
            Rect.fromCenter(center: Offset(dx, dy), width: 100, height: 100),
            -startAngle,
            -sweepAngle,
            false,
            i < 3 ? paintEnabled : paintDisabled);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
