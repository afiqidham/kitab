import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:pos/models/books/book.dart';
import 'package:pos/services/isar_service.dart';

class AddBook extends StatefulWidget {
  const AddBook({Key? key, required this.isarService}) : super(key: key);

  final IsarService isarService;

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  TextEditingController titleTextEditingController = TextEditingController();

  TextEditingController barcodeTextEditingController = TextEditingController();

  TextEditingController priceTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        TextField(
          controller: titleTextEditingController,
        ),
        TextField(
          controller: barcodeTextEditingController,
        ),
        TextField(
          controller: priceTextEditingController,
        ),
        ElevatedButton(
            onPressed: () {
              final books = Book(
                id: Isar.autoIncrement,
                title: '',
                barcode: '',
                price: 0.00,
                qty: 0,
              )
                ..title = titleTextEditingController.text
                ..barcode = barcodeTextEditingController.text
                ..price = double.parse(priceTextEditingController.text);
              widget.isarService.createBook(books);
            },
            child: Text("add Book")),
      ]),
    );
  }
}
