import 'package:flutter/material.dart';
import 'package:pos/ui/components/heading.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: const Color(0xff1f2029),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "images/logo.png",
            height: 300,
            width: double.infinity,
          ),
          const SizedBox(
            height: 15,
          ),
          const Heading(text: 'KITAB'),
        ]),
      ),
    );
  }
}
