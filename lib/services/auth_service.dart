import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_register_web/core/secrets/secrets.dart';
import 'package:login_register_web/core/utils/handling_errors.dart';
import 'package:login_register_web/core/utils/show_snack_bar.dart';


class AuthService {
  void connectUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(
          Uri.parse('$uri/api/signin'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({'email': email, 'password': password}));
      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, 'Login Success !');
          });
    } catch (e) {
      log(e.toString());
    }
  }

  void createAccount(
      {required BuildContext context,
      required String fullName,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(
          Uri.parse('$uri/api/signup'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({'full_name': fullName, 'email': email, 'password': password}));
      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () async {
            showSnackBar(context, 'Account created successfully !');
          });
    } catch (e) {
      log(e.toString());
    }
  }
}
