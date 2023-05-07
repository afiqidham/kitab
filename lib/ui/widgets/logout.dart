import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/ui/components/texts/display_text.dart';
import 'package:pos/utils/route.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () =>
            Get.toNamed(RouteUtil.login),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        const DisplayText(
          text:'Log Out',
          fontSize: 10,
        ),
      ],
    );
  }
}
