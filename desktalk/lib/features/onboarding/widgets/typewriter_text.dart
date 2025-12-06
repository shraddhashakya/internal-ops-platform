import 'package:flutter/material.dart';

class TypewriterText extends StatelessWidget {
  final String text;

  const TypewriterText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, fontFamily: 'monospace'),
    );
  }
}
