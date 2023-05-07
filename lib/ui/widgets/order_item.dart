import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pos/ui/components/heading.dart';
import 'package:pos/ui/components/texts/label_text.dart';
import 'package:pos/ui/components/texts/price_text.dart';
import 'package:pos/ui/view_models/cart_view_model.dart';
import 'package:pos/ui/view_models/home_view_model.dart';
import 'package:pos/models/books/book.dart';

class OrderItem extends StatelessWidget {
  final Book books;
  late CartViewModel controller;
  late int index;
  late HomeViewModel control;

  OrderItem({Key? key, required this.books, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller = Get.find<CartViewModel>();
    control = Get.find<HomeViewModel>();

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xff1f2029),
          boxShadow: const [
            BoxShadow(color: Colors.black, blurRadius: 4, offset: Offset(4, 2))
          ]),
      child: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heading(
                  text: books.title,
                  fontSize: 20,
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
                PriceText(
                  text: "RM${books.price.toStringAsFixed(2)}",
                  fontSize: 15,
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                child: buildQty(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildQty() {
    return Column(
      children: [
        const SizedBox(
          width: 5,
        ),
        Row(
          children: [
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.remove),
              onPressed: () => controller.decreaseQtySelectedItem(index, books),
            ),
            Text(
              "${books.qty}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.white),
            ),
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.add),
              onPressed: () => controller.increaQtyOfSelectedItem(index),
            ),
          ],
        ),
      ],
    );
  }
}
