import 'package:flutter/material.dart';
import 'package:pos/services/isar_service.dart';
import 'package:pos/ui/components/inputs/search_input.dart';

class SearchBar extends StatelessWidget {
  SearchBar({Key? key, required this.isarService}) : super(key: key);

  IsarService isarService;

  String search = "";

  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
      ),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: const Color(0xff1f2029),
      ),
      child: SearchInput(
        onChanged: (value) {  },
        text: "Search",
        controller: searchText,
        )
    );
  }
}
