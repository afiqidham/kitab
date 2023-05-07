import 'package:isar/isar.dart';

part 'transaction.g.dart';

@Collection()
class Transaction {
  Id transId = Isar.autoIncrement;
  late String payment;
  late String invoice;
  late double subTotal;
  late String tax = '6%';
  late double total;
  late DateTime date = DateTime.now();

  Transaction(
      {required this.transId,
      required this.payment,
      required this.invoice,
      required this.subTotal,
      required this.tax,
      required this.total,
      required this.date});

  factory Transaction.fromMap(Map<String, dynamic> map) => Transaction(
        transId: map['transId'],
        payment: map['payment'],
        invoice: map['invoice'],
        subTotal: map['subTotal'],
        tax: map['tax'],
        total: map['total'],
        date: map['date'],
      );

  Map<String, dynamic> toJson() => {
        "transId": transId,
        "payment": payment,
        "invoice": invoice,
        "subTotal": subTotal,
        "tax": tax,
        "total": total,
        "date": date,
      };
}
