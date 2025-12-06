import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final Color topColor;
  final Color bottomColor;

  const GradientBackground({
    super.key,
    required this.child,
    this.topColor = const Color(0xFFDCFF8A), // default top color
    this.bottomColor = Colors.white, // default bottom color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [topColor, bottomColor], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: child,
    );
  }
}
