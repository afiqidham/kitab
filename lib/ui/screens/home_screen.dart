import 'package:flutter/material.dart';
import 'package:pos/ui/view_models/home_view_model.dart';
import 'package:get/get.dart';
import 'package:pos/models/books/book.dart';
import 'package:pos/services/isar_service.dart';
import 'package:pos/ui/widgets/cart_item.dart';
import 'package:pos/ui/widgets/list_item.dart';
import 'package:pos/ui/widgets/search_bar.dart';
import 'package:pos/ui/widgets/top_menu.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, required this.isarService}) : super(key: key);

  final IsarService isarService;

  final HomeViewModel hvm = Get.put(HomeViewModel());

  String search = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 14,
          child: Column(
            children: [
              TopMenu(
                title: ' KITAB ',
                action: SearchBar(
                  isarService: IsarService(),
                ),
              ),
              Expanded(
                child: StreamBuilder<List<Book>>(
                  stream: isarService.getAllBooks(search: search),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final books = snapshot.data;
                      if (books!.isEmpty) {
                        return const Center(
                          child: Text("No Books"),
                        );
                      }
                      return ListView.builder(
                        itemCount: books.length,
                        itemBuilder: (context, index) {
                          return ListItem(books: books[index], hvm: hvm);
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        Expanded(flex: 1, child: Container()),
        CartItem()
      ],
    );
  }
}
