import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:isar/isar.dart';
import 'package:pos/models/books/book.dart';

class HomeViewModel extends GetxController {
  RxList<Book> cart = <Book>[].obs;
  GetStorage box = GetStorage();

  void addItemToCart(Book books)  {
   
    books.qty = 1;
    cart.add(books);

    List<Map<String, dynamic>> itemsCart =
        cart.map((Book e) => e.toJson()).toList();

    box.write('itemsCart', itemsCart);
  }

  void updateSession() {
    box.listenKey('itemsCart', (updateValue) {
      if (updateValue is List) {
        cart.clear();
        cart.addAll(updateValue.map((e) => Book.fromMap(e)).toList());
      }
    });
  }

  void decreaseItemInCart(Book books) {
    if (books.qty == 1) {
      cart.removeWhere((Book selectedItem) => selectedItem.id == books.id);
    } else {
      cart.removeWhere((Book selectedItem) => selectedItem.id == books.id);

      books.qty--;

      cart.add(books);
    }

    List<Map<String, dynamic>> itemsCart =
        cart.map((Book e) => e.toJson()).toList();
    box.write('itemsCart', itemsCart);
  }

  void increaseItemInCart(Book books) {
    cart.removeWhere((Book selectedItem) => selectedItem.id == books.id);

    books.qty++;
    cart.add(books);

    List<Map<String, dynamic>> itemsCart =
        cart.map((Book e) => e.toJson()).toList();

    box.write('itemsCart', itemsCart);
  }

  void removedSelectedItem(int id) {
    cart.removeWhere((Book selectedItem) => selectedItem.id == id);

    List<Map<String, dynamic>> itemsCart =
        cart.map((Book e) => e.toJson()).toList();

    box.write('itemsCart', itemsCart);
  }

  void getUpdateSession() {
    if (box.hasData('itemsCart')) {
      List<dynamic> value = GetStorage().read('itemsCart');
      if (value is List) {
        List<Book> getModelSession =
            value.map((e) => Book.fromMap(e)).toList();
        cart.clear();
        cart.addAll(getModelSession);
      }
    }
    updateSession();
  }

  @override
  void onReady() {
    getUpdateSession();
    super.onReady();
  }
}
