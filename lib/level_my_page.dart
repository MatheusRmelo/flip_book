import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
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
                  left: 320,
                  top: 16,
                  child: GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      child:
                          SvgPicture.asset('assets/levels/complete_level.svg'),
                    ),
                  ),
                ),
                Positioned(
                  left: 220,
                  top: 24,
                  child: GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      child:
                          SvgPicture.asset('assets/levels/current_level.svg'),
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 64,
                  child: GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      child:
                          SvgPicture.asset('assets/levels/blocked_level.svg'),
                    ),
                  ),
                ),
                Positioned(
                  left: 220,
                  top: 120,
                  child: GestureDetector(
                    child: Container(
                      width: 50,
                      height: 50,
                      child:
                          SvgPicture.asset('assets/levels/blocked_level.svg'),
                    ),
                  ),
                ),
              ],
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

    List<int> levels = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    int count = 0;
    bool isLeft = true;
    int mult = 1;
    for (int i = 0; i < levels.length; i++) {
      double dx = i == 0
          ? 300
          : !isLeft
              ? 300
              : 229;
      double dy = 20 + ((i == 0 ? 0 : mult) * 70);
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
        startAngle = !isLeft ? pi * 5 / 4 : pi * 3;
        if (i % 2 != 0) {
          canvas.drawArc(
              Rect.fromCenter(center: Offset(dx, dy), width: 100, height: 100),
              startAngle,
              sweepAngle,
              false,
              i < 2 ? paintEnabled : paintDisabled);
        } else {
          canvas.drawArc(
              Rect.fromCenter(center: Offset(dx, dy), width: 100, height: 100),
              -startAngle,
              -sweepAngle,
              false,
              i < 2 ? paintEnabled : paintDisabled);
        }

        count++;
        if (count == 2) {
          isLeft = !isLeft;
          count = 0;
          mult++;
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
