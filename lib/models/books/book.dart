import 'package:isar/isar.dart';

part 'book.g.dart';

@Collection()
class Book {
  Id id = Isar.autoIncrement;
  late String title;
  late String barcode;
  late double price = double.parse(id.toStringAsFixed(2));
  late int qty;
  bool isSynced;

  Book({
    required this.id,
    required this.title,
    required this.barcode,
    required this.price,
    required this.qty,
    this.isSynced = true,
  });

  factory Book.fromMap(Map<String, dynamic> map) => Book(
        id: map['id'],
        title: map['title'],
        barcode: map['barcode'],
        price: map['price'],
        qty: map['qty'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "barcode": barcode,
        "price": price,
        "qty": qty,
      };
}
