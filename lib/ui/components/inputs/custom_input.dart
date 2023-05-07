import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String text;
  final Widget? suffixIcon;
  final String? suffixText;
  final TextEditingController? controller;
  final String? errorText;
  final bool obsecureText;
  final String Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;

  const CustomInput(
      {required this.text,
      this.suffixIcon,
      this.suffixText,
      this.controller,
      this.errorText,
      this.hintText,
      this.validator,
      this.keyboardType,
      this.obsecureText = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obsecureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black12,
          suffixIcon: suffixIcon,
          labelText: text,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(20),
          ),
          hintStyle: const TextStyle(
            color: Colors.white54,
          ),
          labelStyle: const TextStyle(color: Colors.white, fontSize: 16),
          suffixIconColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.focused)
                  ? Colors.red
                  : Colors.black)),
    );
  }
}
