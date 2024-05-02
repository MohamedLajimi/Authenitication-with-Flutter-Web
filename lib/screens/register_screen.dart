import 'package:flutter/material.dart';
import 'package:login_register_web/components/auth_button.dart';
import 'package:login_register_web/components/auth_field.dart';
import 'package:login_register_web/core/theme/app_palette.dart';
import 'package:login_register_web/screens/login_screen.dart';
import 'package:login_register_web/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthService();

  @override
  void dispose() {
    super.dispose();
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MediaQuery.of(context).size.width > 800
            ? AppPalette.backgroundColor
            : AppPalette.white,
        body: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
            width: 600,
            height: 600,
            color: AppPalette.white,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(
                        color: AppPalette.purple,
                        fontSize: 36,
                        fontWeight: FontWeight.w800),
                  ),
                  Container(
                    height: 6,
                    width: 60,
                    decoration: BoxDecoration(
                        color: AppPalette.purple,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  AuthField(
                      controller: _fullNameController,
                      obscureText: false,
                      hintText: 'Full Name',
                      icon: const Icon(Icons.person)),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthField(
                      controller: _emailController,
                      obscureText: false,
                      hintText: 'Email',
                      icon: const Icon(Icons.email)),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthField(
                      controller: _passwordController,
                      obscureText: true,
                      hintText: 'Password',
                      icon: const Icon(Icons.lock)),
                  const SizedBox(
                    height: 40,
                  ),
                  AuthButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _authService.createAccount(
                              context: context,
                              fullName: _fullNameController.text,
                              email: _emailController.text,
                              password: _passwordController.text);
                        }
                      },
                      text: 'Create Account'),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account ?',
                        style: TextStyle(color: AppPalette.grey),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                              color: AppPalette.purple,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
