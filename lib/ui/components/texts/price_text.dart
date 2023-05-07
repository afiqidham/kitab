import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final String text;
  final double? fontSize;
  const PriceText({required this.text, this.fontSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.red, fontSize: fontSize, fontWeight: FontWeight.bold),
    );
  }
}
