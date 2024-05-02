import 'package:flutter/material.dart';
import 'package:login_register_web/core/theme/app_palette.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  const AuthButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.height * 0.8,
        child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0),
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 20)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
                backgroundColor:
                    const MaterialStatePropertyAll(AppPalette.purple)),
            child: Text(
              text,
              style: const TextStyle(
                  color: AppPalette.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3),
            )));
  }
}
