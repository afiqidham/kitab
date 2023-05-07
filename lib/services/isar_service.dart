import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pos/models/books/book.dart';
import 'package:pos/models/transactions/transaction.dart';
import 'package:pos/models/users/user.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [BookSchema, TransactionSchema, UserSchema],
        inspector: true,
      );
    }

    return Future.value(Isar.getInstance());
  }

  // final users = User()
  //   ..userId = Isar.autoIncrement
  //   ..email = 'afiq.zaki25@gmail.com'
  //   ..first = 'Afiq'
  //   ..last = 'Zaki'
  //   ..phone = '01165097507'
  //   ..position = 'Cashier';

  Future<void> createBook(Book newBook) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.books.putSync(newBook));
  }

  Stream<List<Book>> getAllBooks({String? search}) async* {
    print(search);
    final isar = await db;
    final query = isar.books
        .where()
        .filter()
        .titleContains(search ?? '', caseSensitive: false)
        .sortByTitle();

    await for (final result in query.watch(fireImmediately: true)) {
      if (result.isNotEmpty) {
        yield result;
      }
    }
  }

  Future<void> transactionData(Transaction newTrans) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.transactions.putSync(newTrans));
  }

  // Future<void> addUser(User users) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.users.putSync(users));
  // }

  // void updateSync(Books books) async {
  //   books.isSynced = true;
  //   await isarInstance.writeTxn(() async {
  //     await isarInstance.books.put(books);
  //   });
  // }

  // getUnsyncedData() async {
  //   IsarCollection<Books> booksCollection = isarInstance.collection<Books>();
  //   List<Books> books =
  //       await booksCollection.filter().isSyncedEqualTo(false).findAll();
  //   return books;
  // }
}
