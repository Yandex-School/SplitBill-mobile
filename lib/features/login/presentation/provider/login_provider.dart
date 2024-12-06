import 'package:flutter/material.dart';
import 'package:split_bill/features/login/data/models/login_state.dart';


class LoginProvider extends ChangeNotifier {
  static final _emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#%&'*+-/=?^_{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final _passwordRegExp = RegExp(
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}");

  LoginState _state = LoginState.initial();

  LoginState get state => _state;

  void setEmail(String value) {
    _state = _state.copyWith(
      email: value,
      isValidEmail: _emailRegExp.hasMatch(value),
    );
    notifyListeners();
  }

  void setPassword(String value) {
    _state = _state.copyWith(
      password: value,
      isValidPassword: _passwordRegExp.hasMatch(value),
    );
    notifyListeners();
  }

  void toggleShowPassword() {
    _state = _state.copyWith(showPassword: !_state.showPassword);
    notifyListeners();
  }

  bool validateCredentials() {
    return _state.isValidEmail &&
        _state.isValidPassword &&
        _state.email.isNotEmpty &&
        _state.password.isNotEmpty;
  }

  void clearData() {
    _state = LoginState.initial();
    notifyListeners();
  }
}
