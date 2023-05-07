// import 'dart:async';
// import 'dart:io';

// import 'package:rxdart/rxdart.dart';
// import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
// import 'package:pos/enum/printer_enum.dart';

// class BluetoothPrinter {
//   BluetoothPrinter(this._device);
//   final BluetoothDevice _device;

//   String? get name => _device.name;
//   String? get address => _device.address;
//   int? get type => _device.type;
// }

// class BluetoothPrinterManager {
//   final BluetoothManager _bluetoothManager = BluetoothManager.instance;
//   bool _isPrinting = false;
//   bool _isConnected = false;
//   late StreamSubscription _scanResultSubscription;
//   late StreamSubscription _isScanningSubscription;
//   late BluetoothPrinter _selectedPrinter;

//   final BehaviorSubject<bool> _isScanning = BehaviorSubject.seeded(false);
//   Stream<bool> get _isScanningStream => _isScanning.stream;

//   final BehaviorSubject<List<BluetoothPrinter>> _scanResult =
//       BehaviorSubject.seeded([]);
//   Stream<List<BluetoothPrinter>> get scanResult => _scanResult.stream;

//   Future _runDelayed(int seconds) {
//     return Future<dynamic>.delayed(Duration(seconds: seconds));
//   }

//   void startScan(Duration timeout) async {
//     _scanResult.add(<BluetoothPrinter>[]);

//     _bluetoothManager.startScan(timeout: timeout);

//     _scanResultSubscription = _bluetoothManager.scanResults.listen((devices) {
//       _scanResult.add(devices.map((d) => BluetoothPrinter(d)).toList());
//     });

//     _isScanningSubscription =
//         _bluetoothManager.isScanning.listen((isScanningCurrent) async {
//       if (_isScanning.value! && !isScanningCurrent) {
//         _scanResultSubscription.cancel();
//         _isScanningSubscription.cancel();
//       }
//       _isScanning.add(isScanningCurrent);
//     });
//   }

//   void stopScan() async {
//     await _bluetoothManager.stopScan();
//   }

//   void selectPrinter(BluetoothPrinter printer) {
//     _selectedPrinter = printer;
//   }

//   Future<PosPrintResult> writeBytes(
//     List<int> bytes, {
//     int chunkSizeBytes = 20,
//     int queueSleepTimeMs = 20,
//   }) async {
//     final Completer<PosPrintResult> completer = Completer();

//     const int timeout = 5;
//     if (_selectedPrinter == null) {
//       return Future<PosPrintResult>.value(PosPrintResult.printerNotSelected);
//     } else if (_isScanning.value!) {
//       return Future<PosPrintResult>.value(PosPrintResult.scanInProgress);
//     } else if (_isPrinting) {
//       return Future<PosPrintResult>.value(PosPrintResult.printInProgress);
//     }

//     _isPrinting = true;

//     await _bluetoothManager.startScan(timeout: Duration(seconds: 1));
//     await _bluetoothManager.stopScan();

//     await _bluetoothManager.connect(_selectedPrinter._device);

//     _bluetoothManager.state.listen((state) async {
//       switch (state) {
//         case BluetoothManager.CONNECTED:
//           if (_isConnected) {
//             final len = bytes.length;
//             List<List<int>> chunks = [];
//             for (var i = 0; i < len; i += chunkSizeBytes) {
//               var end = (i + chunkSizeBytes < len) ? i + chunkSizeBytes : len;
//               chunks.add(bytes.sublist(i, end));
//             }

//             for (var i = 0; i < chunks.length; i += 1) {
//               await _bluetoothManager.writeData(chunks[i]);
//               sleep(Duration(milliseconds: queueSleepTimeMs));
//             }

//             completer.complete(PosPrintResult.success);
//           }

//           _runDelayed(3).then((dynamic v) async {
//             await _bluetoothManager.disconnect();
//             _isPrinting = false;
//           });

//           _isConnected = true;

//           break;
//         case BluetoothManager.DISCONNECTED:
//           _isConnected = false;
//           break;
//         default:
//           break;
//       }
//     });

//     _runDelayed(timeout).then((dynamic v) async {
//       if (_isPrinting) {
//         _isPrinting = false;
//         completer.complete(PosPrintResult.timeout);
//       }
//     });

//     return completer.future;
//   }

//   Future<PosPrintResult> printTicket(
//     List<int> bytes, {
//     int chunkSizeBytes = 20,
//     int queueSleepTimeMs = 20,
//   }) async {
//     if (bytes.isEmpty) {
//       return Future<PosPrintResult>.value(PosPrintResult.ticketEmpty);
//     }
//     return writeBytes(
//       bytes,
//       chunkSizeBytes: chunkSizeBytes,
//       queueSleepTimeMs: queueSleepTimeMs,
//     );
//   }
// }
