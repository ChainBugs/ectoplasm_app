import "dart:math";
import "package:flutter/material.dart";

/// An scalable endless progress indicator in the shape of bouncing balls
class ProgressBalls extends StatefulWidget {
  final Color color;
  final double height;
  final int numBalls;

  ProgressBalls(
      {this.color = Colors.black, this.height = 10, this.numBalls = 3});

  @override
  State<StatefulWidget> createState() {
    return ProgressBallsState();
  }
}

class ProgressBallsState extends State<ProgressBalls>
    with SingleTickerProviderStateMixin {
  double _phase = 0;
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    _animation = CurvedAnimation(curve: SawTooth(1), parent: _controller)
      ..addListener(() {
        setState(() {
          _phase = _animation.value;
        });
      });

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final balls = List.generate(widget.numBalls, (index) {
      final phaseOffset = index * 1.5 * pi / widget.numBalls;
      return Padding(
          padding: EdgeInsets.only(
              left: widget.height / 2, right: widget.height / 2),
          child: CustomPaint(
              size: Size(widget.height, widget.height),
              painter: BallPainter(_phase,
                  phaseOffset: phaseOffset, color: widget.color)));
    });

    return Container(
        child: Center(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: balls))));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class BallPainter extends CustomPainter {
  final double phase;
  final double phaseOffset;
  final Paint _paint;

  BallPainter(this.phase, {Color color = Colors.black, this.phaseOffset = 0})
      : _paint = Paint()
          ..color = color
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    final mid = size.height / 2;
    final phaseAngle = phase * pi * 2 + phaseOffset;
    final vPos = sin(phaseAngle) * mid + mid;
    _paint.color =
        _paint.color.withOpacity(0.3 + 0.7 * (cos(phaseAngle) + 1) / 2);
    canvas.drawCircle(Offset(size.width / 2, vPos), size.width / 2, _paint);
  }

  @override
  bool shouldRepaint(BallPainter oldDelegate) {
    return oldDelegate.phase != phase;
  }
}
