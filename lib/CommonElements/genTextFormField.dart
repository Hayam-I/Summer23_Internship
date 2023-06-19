import 'package:flutter/material.dart';

class GenTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintName;
  final IconData iconData;
  final bool isObscureText;

  const GenTextFormField({super.key, 
    required this.controller,
    required this.hintName,
    required this.iconData,
    required this.isObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      cursorColor: Colors.green,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.green),
        ),
        prefixIcon: Icon(iconData, color: Colors.green),
        hintText: hintName,
        fillColor: Colors.grey[200],
        filled: true,
      ),
    );
  }
}
