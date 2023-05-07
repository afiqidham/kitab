import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/ui/components/heading.dart';
import 'package:pos/ui/components/texts/label_text.dart';
import 'package:pos/ui/components/texts/price_text.dart';
import 'package:pos/ui/view_models/home_view_model.dart';
import 'package:pos/models/books/book.dart';

class ListItem extends StatelessWidget {
  Book books;
  HomeViewModel hvm;

  ListItem({Key? key, required this.books, required this.hvm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20, bottom: 20),
      padding: const EdgeInsets.only(left: 20, bottom: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xff1f2029),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Heading(
            text: books.title,
            fontSize: 25,
          ),
          const SizedBox(
            height: 10,
          ),
          LabelText(
            text: books.barcode,
            fontSize: 15,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PriceText(
                text: "RM${books.price.toStringAsFixed(2)}",
                fontSize: 20,
              ),
              Column(
                children: [
                  Obx(() {
                    Book? selectedBooks = hvm.cart.firstWhereOrNull(
                        (Book selectedItem) => selectedItem.id == books.id);

                    if (selectedBooks == null) {
                      return ElevatedButton.icon(
                        icon: const Icon(Icons.shopping_cart),
                        label: const Text("Add Cart"),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () => hvm.addItemToCart(books),
                      );
                    } else {
                      return deleteButton(selectedBooks);
                    }
                  }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget deleteButton(Book selectedBooks) {
    return Row(
      children: [
        ElevatedButton.icon(
          icon: const Icon(Icons.delete),
          label: const Text('Delete'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () => hvm.removedSelectedItem(selectedBooks.id),
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
