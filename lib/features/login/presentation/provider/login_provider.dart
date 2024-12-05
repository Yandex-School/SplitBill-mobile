import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
   String _email = 'user@example.com'; 
  String _password = 'Password1!'; 
  bool _isValidEmail = true;
  bool _isValidPassword = true;
  bool _showPassword = true;


  String get email => _email;
  String get password => _password;
  bool get isValidEmail => _isValidEmail;
  bool get isValidPassword => _isValidPassword;
  bool get showPassword => _showPassword;


  void setEmail(String value) {
    _email = value;
    _isValidEmail = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    notifyListeners(); 
  }

  void setPassword(String value) {
    _password = value;
    _isValidPassword = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}").hasMatch(value);
    notifyListeners();
  }

  void toggleShowPassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  bool validateCredentials() {
    return _isValidEmail && _isValidPassword && _email.isNotEmpty && _password.isNotEmpty;
  }

  void clearData() {
    _email = '';
    _password = '';
    _isValidEmail = true;
    _isValidPassword = true;
    _showPassword = true;
    notifyListeners();
  }
}
