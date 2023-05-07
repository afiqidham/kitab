import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  final String text;
  final double? fontSize;
  const Heading({required this.text, this.fontSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
