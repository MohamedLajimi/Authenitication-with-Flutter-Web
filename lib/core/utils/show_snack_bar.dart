import 'package:flutter/material.dart';
import 'package:login_register_web/core/theme/app_palette.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: AppPalette.purple,
    content: Text(
      text,
      style: const TextStyle(fontSize: 18),
    ),
  ));
}
