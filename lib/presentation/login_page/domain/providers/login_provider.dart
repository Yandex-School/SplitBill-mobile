import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  String email = '';
  String password = '';
  bool isValidEmail = true;
  bool isValidPassword = true;
  bool showPassword = true;

  void setEmail(String value) {
    email = value;
    isValidEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    notifyListeners();
  }

  void setPassword(String value) {
    password = value;
    isValidPassword = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}").hasMatch(value);
    notifyListeners();
  }

  void toggleShowPassword() {
    showPassword = !showPassword;
    notifyListeners();
  }

  bool validateCredentials() {
    return isValidEmail && isValidPassword && email.isNotEmpty && password.isNotEmpty;
  }
}
