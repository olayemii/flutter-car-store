import 'package:flutter/material.dart';

class FadeSlide extends StatelessWidget {
  final double offsetX;
  final double offsetY;
  final int duration;
  final Widget child;
  final bool direction;

  FadeSlide({
    @required this.offsetX,
    @required this.offsetY,
    @required this.duration,
    @required this.child,
    @required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: direction ? 1 : 0,
      duration: Duration(milliseconds: duration),
      child: AnimatedContainer(
        transform: direction
            ? Matrix4.translationValues(0.0, 0.0, 0.0)
            : Matrix4.translationValues(offsetX, offsetY, 0.0),
        duration: Duration(milliseconds: duration),
        child: child,
      ),
    );
  }
}
