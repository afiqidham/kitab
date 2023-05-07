import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class ScannerModel extends GetxController {
  String scanCode = '';

  Future<void> scanBarcode() async {
    try {
      scanCode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      Get.dialog(AlertDialog(
        title: const Text("Error"),
        content: const Text('The book not exist.'),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text("Close")),
        ],
      ));
    }
  }
}
