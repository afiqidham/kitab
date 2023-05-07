import 'package:flutter/material.dart';

class TopMenu extends StatelessWidget {
  String title;
  Widget action;

  TopMenu({Key? key, required this.title, required this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: 'Bubblegum'),
            ),
          ],
        ),
        Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
            )),
        Expanded(flex: 1, child: action),
      ],
    );
  }
}
