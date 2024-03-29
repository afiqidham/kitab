import 'package:flutter/material.dart';

class DisplayText extends StatelessWidget {
  final String text;
  final double? fontSize;
  const DisplayText({required this.text, this.fontSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
