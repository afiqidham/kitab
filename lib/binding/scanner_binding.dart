import 'package:get/get.dart';
import 'package:pos/ui/view_models/scanner_model.dart';

class ScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScannerModel());
  }
}
