import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  final String text;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const SearchInput({required this.text,required this.onChanged, this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: text,
        hintText: "Search Book",
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.white,
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        hintStyle: const TextStyle(color: Colors.white54, fontSize: 10),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
