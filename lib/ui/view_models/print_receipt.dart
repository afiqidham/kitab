// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:pos/library/ecs_pos_bluetooth.dart';

// class PrintReceipt extends GetxController {
//   BluetoothPrinterManager printerManager = BluetoothPrinterManager();
//   RxList<BluetoothPrinter> _devices = <BluetoothPrinter>[].obs;
//   var devicesCount = 0.obs;

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();

//     printerList();
//   }

//   void printerList() {
//     printerManager.scanResult.listen((devices) async {
//       _devices = devices.obs;
//     });
//   }

//   void startScanDevices() {
//     devicesCount.value = _devices.length;
//     printerManager.startScan(const Duration(seconds: 4));
//   }

//   void stopScanDevices() {
//     printerManager.stopScan();
//   }

//   Future<List<int>> receipt(
//       PaperSize paperSize, CapabilityProfile profile) async {
//     final Generator ticket = Generator(paperSize, profile);
//     List<int> bytes = [];

//     final ByteData data = await rootBundle.load('images/');
//     final List<int> imageBytes = data.buffer.asInt8List();
//     // final Image image = decodeImage(imageBytes);
//     // bytes += ticket.image(image);

//     bytes += ticket.text('KITAB',
//         styles: const PosStyles(
//           align: PosAlign.center,
//           height: PosTextSize.size2,
//           width: PosTextSize.size2,
//         ),
//         linesAfter: 1);

//     bytes += ticket.text('899 Watson Lane',
//         styles: const PosStyles(align: PosAlign.center));
//     bytes += ticket.text('New Braunfels, TX',
//         styles: const PosStyles(align: PosAlign.center));
//     bytes += ticket.text('Tel: 01234567890',
//         styles: const PosStyles(align: PosAlign.center));
//     bytes += ticket.text('Web: www.Kitab.com',
//         styles: const PosStyles(align: PosAlign.center));

//     bytes += ticket.hr();
//     bytes += ticket.row([
//       PosColumn(text: 'Qty', width: 1),
//       PosColumn(text: 'Item', width: 7),
//       PosColumn(
//           text: 'Price',
//           width: 2,
//           styles: const PosStyles(align: PosAlign.right)),
//       PosColumn(
//           text: 'Total',
//           width: 2,
//           styles: const PosStyles(align: PosAlign.right)),
//     ]);

//     bytes += ticket.row([
//       PosColumn(text: '1', width: 1),
//       PosColumn(
//         text: 'Book1',
//         width: 7,
//       ),
//       PosColumn(
//           text: '3.45',
//           width: 2,
//           styles: const PosStyles(align: PosAlign.right)),
//       PosColumn(
//           text: '3.45',
//           width: 2,
//           styles: const PosStyles(align: PosAlign.right)),
//     ]);

//     bytes += ticket.hr();

//     bytes += ticket.row([
//       PosColumn(
//         text: 'Total',
//         width: 6,
//         styles: PosStyles(height: PosTextSize.size2, width: PosTextSize.size2),
//       ),
//       PosColumn(
//         text: '\RM10.00',
//         width: 6,
//         styles: PosStyles(height: PosTextSize.size2, width: PosTextSize.size2),
//       )
//     ]);

//     bytes += ticket.hr(ch: '=', linesAfter: 1);

//     bytes += ticket.row([
//       PosColumn(
//         text: 'Cash',
//         width: 7,
//         styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2),
//       ),
//       PosColumn(
//           text: '\RM15.00',
//           width: 5,
//           styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
//     ]);

//     bytes += ticket.row([
//       PosColumn(
//         text: 'Change',
//         width: 7,
//         styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2),
//       ),
//       PosColumn(
//           text: '\RM5.00',
//           width: 5,
//           styles: PosStyles(align: PosAlign.right, width: PosTextSize.size2)),
//     ]);

//     bytes += ticket.feed(2);
//     bytes += ticket.text('Thank you!',
//         styles: PosStyles(align: PosAlign.center, bold: true));

//     final now = DateTime.now();
//     final formatter = DateFormat('dd/MM/yyyy H:m');
//     final String timeStamp = formatter.format(now);
//     bytes += ticket.text(timeStamp,
//         styles: PosStyles(align: PosAlign.center), linesAfter: 2);

//     ticket.feed(2);
//     ticket.cut();
//     return bytes;
//   }
// }
