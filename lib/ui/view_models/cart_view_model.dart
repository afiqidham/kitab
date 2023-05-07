import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pos/models/books/book.dart';

class CartViewModel extends GetxController {
  RxList<Book> cart = <Book>[].obs;
  GetStorage box = GetStorage();
  Rx<double> total = 0.00.obs;
  Rx<double> subTotal = 0.00.obs;

  // Map<String,dynamic> userSession = GetStorage().read(key)

  void removeSelectedItemFromCart(int index) {
    cart.removeAt(index);

    List<Map<String, dynamic>> itemsCart =
        cart.map((Book e) => e.toJson()).toList();

    box.write('itemsCart', itemsCart);
  }

  void increaQtyOfSelectedItem(int index) {
    cart[index].qty++;

    List<Map<String, dynamic>> itemsCart =
        cart.map((Book e) => e.toJson()).toList();

    box.write('itemsCart', itemsCart);
  }

  void decreaseQtySelectedItem(int index, Book books) {
    if (books.qty == 1) {
      cart.removeAt(index);
    } else {
      cart[index].qty--;
    }
    List<Map<String, dynamic>> itemsCart =
        cart.map((Book e) => e.toJson()).toList();

    box.write('itemsCart', itemsCart);
  }

  void calculateSubTotal() {
    subTotal.value = 0;
    for (int i = 0; i < cart.length; i++) {
      subTotal = subTotal + (cart[i].qty * cart[i].price);
    }
  }

  void calculateTotalAmout() {
    total.value = 0;
    for (int i = 0; i < cart.length; i++) {
      total = total +
          (cart[i].qty * cart[i].price + (cart[i].qty * cart[i].price * 0.06));
    }
  }

  void updatingSession() {
    box.listenKey('itemsCart', (updateValue) {
      if (updateValue is List) {
        cart.clear();
        cart.addAll(updateValue.map((e) => Book.fromMap(e)).toList());
        calculateSubTotal();
        calculateTotalAmout();
      }
    });
  }

  void getUpdateSessionCart() {
    if (box.hasData('itemsCart')) {
      List<dynamic> value = GetStorage().read('itemsCart');

      if (value is List) {
        cart.clear();
        cart.addAll(value.map((e) => Book.fromMap(e)).toList());
        calculateTotalAmout();
      }
    }
    updatingSession();
  }

  @override
  void onReady() {
    getUpdateSessionCart();
    super.onReady();
  }

  void transactionCompleted() {
    box.write("itemsCart", []).then((value) {
      total.value = 0;
      cart.clear();
      Get.snackbar("Message", "Payment succeed ! ",
          colorText: Colors.white,
          backgroundColor: const Color(0xff4D4D4D),
          snackPosition: SnackPosition.BOTTOM);
    });
  }
}
