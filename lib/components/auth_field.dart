import 'package:flutter/material.dart';
import 'package:login_register_web/core/theme/app_palette.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon icon;
  const AuthField(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.hintText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill in this field';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        
        prefixIcon: icon,
        prefixIconColor: Colors.grey,
        hintText: hintText,
        hintStyle: const TextStyle(color: AppPalette.grey, fontSize: 16),
        filled: true,
        fillColor: AppPalette.backgroundColor,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppPalette.purple)),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
