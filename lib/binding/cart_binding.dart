import 'package:get/get.dart';
import 'package:pos/ui/view_models/cart_view_model.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartViewModel());
  }
}
