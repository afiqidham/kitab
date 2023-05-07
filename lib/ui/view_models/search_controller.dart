import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pos/models/books/book.dart';
import 'package:pos/services/isar_service.dart';

class SearchController extends GetxController {
  late final IsarService isar;
  bool searching = false;
  TextEditingController searchController = TextEditingController();

  SearchBook() async {}
}
