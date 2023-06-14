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
    final paint = Paint()
      ..color = Colors.deepPurple
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    //List<int> levels = [1];

    canvas.drawArc(
        Rect.fromCenter(center: Offset(300, 200), width: 100, height: 100),
        0,
        pi * 3 / 4,
        false,
        paint);
    canvas.drawArc(
        Rect.fromCenter(center: Offset(229, 270), width: 100, height: 100),
        pi * 3,
        pi * 3 / 4,
        false,
        paint..color = Colors.red);
    canvas.drawArc(
        Rect.fromCenter(center: Offset(229, 270), width: 100, height: 100),
        pi * 3,
        -pi * 3 / 4,
        false,
        paint..color = Colors.redAccent);
    canvas.drawArc(
        Rect.fromCenter(center: Offset(300, 340), width: 100, height: 100),
        pi * 5 / 4,
        pi * 3 / 4,
        false,
        paint..color = Colors.black);
    canvas.drawArc(
        Rect.fromCenter(center: Offset(300, 341), width: 100, height: 100),
        0,
        pi * 3 / 4,
        false,
        paint..color = Colors.green);
    canvas.drawArc(
        Rect.fromCenter(center: Offset(229, 412), width: 100, height: 100),
        pi * 3,
        pi * 3 / 4,
        false,
        paint..color = Colors.blue);
    canvas.drawArc(
        Rect.fromCenter(center: Offset(229, 412), width: 100, height: 100),
        pi * 3,
        -pi * 3 / 4,
        false,
        paint..color = Colors.blueAccent);
    canvas.drawArc(
        Rect.fromCenter(center: Offset(300, 483), width: 100, height: 100),
        pi * 5 / 4,
        pi * 3 / 4,
        false,
        paint..color = Colors.black);
    canvas.drawArc(
        Rect.fromCenter(center: Offset(300, 484), width: 100, height: 100),
        0,
        pi * 3 / 4,
        false,
        paint..color = Colors.green);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
