import 'package:get/get.dart';
import 'package:pos/ui/view_models/home_view_model.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
  }
}
