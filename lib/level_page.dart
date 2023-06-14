import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LevelPage2 extends StatefulWidget {
  const LevelPage2({super.key});

  @override
  State<LevelPage2> createState() => _LevelPage2State();
}

class _LevelPage2State extends State<LevelPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          children: [
            Positioned.fill(
                child: CustomPaint(
              painter: FlipBookPainter(),
              child: Container(
                height: double.infinity,
                width: double.infinity,
              ),
            )),
            Positioned(
              child: GestureDetector(
                child: Container(
                  width: 50,
                  height: 50,
                  child: SvgPicture.asset('assets/levels/complete_level.svg'),
                ),
              ),
              left: 325,
              top: 160,
            ),
            Positioned(
              child: GestureDetector(
                child: Container(
                  width: 50,
                  height: 50,
                  child: SvgPicture.asset('assets/levels/current_level.svg'),
                ),
              ),
              left: 230,
              top: 200,
            ),
            Positioned(
              child: Container(
                width: 50,
                height: 50,
                child: SvgPicture.asset('assets/levels/blocked_level.svg'),
              ),
              left: 225,
              top: 290,
            ),
            Positioned(
              child: Container(
                width: 50,
                height: 50,
                child: SvgPicture.asset('assets/levels/blocked_level.svg'),
              ),
              left: 225,
              top: 290,
            ),
            Positioned(
              child: Container(
                width: 50,
                height: 50,
                child: SvgPicture.asset('assets/levels/trophy.svg'),
              ),
              left: 240,
              top: 830,
            ),
          ],
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
      double dx = i % 2 == 0 ? 300 : 228;
      double dy = 200 + (i * 70);
      double startAngle = 0;
      double sweepAngle = pi * 3 / 4;
      if (i != 0) {
        startAngle = i % 2 == 0 ? pi * 5 / 4 : pi / 4;
        sweepAngle = pi * 3 / 2;
      }
      canvas.drawArc(
          Rect.fromCenter(center: Offset(dx, dy), width: 100, height: 100),
          startAngle,
          sweepAngle,
          false,
          i < 1 ? paintEnabled : paintDisabled);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
