import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class CustomArc extends CustomPainter {
  final double size;
  final Color color;
  final double rad;
  CustomArc({required this.color, required this.rad, this.size = 300});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, this.size, this.size);
    final startAngle = math.pi * rad;
    final sweepAngle = math.pi / 3;
    final useCenter = true;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = this.size * math.log(this.size);
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CustomCircularProgressIndicator extends StatefulWidget {
  final double radius;
  final List<Color> colors;
  const CustomCircularProgressIndicator(
      {super.key, required this.radius, required this.colors});

  @override
  State<CustomCircularProgressIndicator> createState() =>
      _CustomCircularProgressIndicatorState();
}

class _CustomCircularProgressIndicatorState
    extends State<CustomCircularProgressIndicator>
    with TickerProviderStateMixin {
  late AnimationController _animationCircleController;
  late Animation<double> _animationCircle;
  late Animation<double> _animationShield;
  late AnimationController _animationShieldController;
  late List<double> customPositionValues = [
    1.0,
    1.5,
    2.0,
    2.5,
    3.0,
    3.5,
    4.0,
    4.5,
    5.5
  ];

  @override
  void initState() {
    _animationCircleController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 40000));
    _animationCircleController.repeat(reverse: false);
    _animationCircle = Tween(begin: 1.0, end: 10 * math.pi)
        .animate(_animationCircleController)
      ..addListener(() => setState(
          () {})); // .. just calls animate without considering its return type

    _animationShieldController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _animationShieldController.repeat(reverse: true);
    _animationShield = Tween(begin: 1.0, end: 2.0).animate(CurvedAnimation(
        parent: _animationShieldController, curve: Curves.easeIn))
      ..addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationCircleController.dispose();
    _animationShieldController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.center, children: [
      ...widget.colors.mapIndexed(
        (index, color) {
          return CustomPaint(
            size: Size(
              widget.radius,
              widget.radius,
            ),
            painter: CustomArc(
                color: color,
                rad: customPositionValues[index] + _animationCircle.value,
                size: widget.radius),
          );
        },
      ),
      ScaleTransition(
        scale: _animationShield,
        child: Icon(
          Icons.shield_rounded,
          color: Colors.white,
        ),
      )
    ]);
  }
}

class CustomThreatFinder {
  bool _isCalled = false;
  late OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) =>
    _isCalled = true;
    return Center(
        child: CustomCircularProgressIndicator(radius: 300, colors: [
      Colors.red.withValues(alpha: 0.7),
    ])
        // )
        );
  });
  void threatDetectorLoading(BuildContext context) {
    !_isCalled
        ? WidgetsBinding.instance.addPostFrameCallback(
            (_) => Overlay.of(context).insert(overlayEntry))
        : null;
  }

  void removeThreadDetectorLoading() {
    if (overlayEntry.mounted == true) {
      overlayEntry.remove();
      overlayEntry.dispose();
    }
  }
}
