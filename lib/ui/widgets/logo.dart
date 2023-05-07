import 'package:flutter/material.dart';
import 'package:pos/ui/components/heading.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red,
          ),
          child: Image.asset(
            "images/logo.png",
            fit: BoxFit.cover,
          ),
          // child: const Icon(Icons.store, color: Colors.white, size: 20,),
        ),
        const SizedBox(
          height: 10,
        ),
        const Heading(
          text: 'KITAB',
        ),
      ],
    );
  }
}
