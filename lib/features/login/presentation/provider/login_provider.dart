import 'dart:async';

import 'package:flutter/material.dart';
import 'package:split_bill/core/DI/dependencies_config.dart';
import 'package:split_bill/core/local_data/shared_preferences.dart';
import 'package:split_bill/core/utils/const.dart';
import 'package:split_bill/features/login/data/login_data_source.dart';
import 'package:split_bill/features/login/data/models/login_state.dart';
import 'package:split_bill/features/login/data/models/register_state.dart';

class LoginProvider extends ChangeNotifier {
  AuthorizationRepository get _authRepo => getIt<AuthorizationRepository>();
  SharedPrefsService get _sharedPrefs => getIt<SharedPrefsService>();

  static final _passwordRegExp =
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}");

  LoginState _loginState = LoginState.initial();
  RegisterState _registerState = RegisterState.initial();

  LoginState get loginState => _loginState;
  RegisterState get registerState => _registerState;

  void setLoginState({
    String? nickname,
    String? password,
    bool? showPassword,
    bool? showConfirmPassword,
    bool? loading,
  }) {
    _loginState = _loginState.copyWith(
      nickname: nickname ?? _loginState.nickname,
      password: password ?? _loginState.password,
      showPassword: showPassword ?? _loginState.showPassword,
      showConfirmPassword: showConfirmPassword ?? _loginState.showConfirmPassword,
      loading: loading ?? _loginState.loading,
    );
    notifyListeners();
  }

  void setRegisterState({
    String? nickname,
    String? password,
    String? confirmPassword,
    bool? showPassword,
    bool? showConfirmPassword,
    bool? loading,
  }) {
    _registerState = _registerState.copyWith(
      nickname: nickname ?? _registerState.nickname,
      password: password ?? _registerState.password,
      confirmPassword: confirmPassword ?? _registerState.confirmPassword,
      showPassword: showPassword ?? _registerState.showPassword,
      showConfirmPassword: showConfirmPassword ?? _registerState.showConfirmPassword,
      loading: loading ?? _registerState.loading,
    );
    notifyListeners();
  }

  Future<bool> registerUser() async {
    setRegisterState(loading: true);
    final result = await _authRepo.register(
      username: _registerState.nickname,
      password: _registerState.password,
      fullName: _registerState.nickname,
    );
    setRegisterState(loading: false);
    return result.fold(
      (l) {
        setRegisterState(loading: false);
        return false;
      },
      (r) {
        if (r?.id != null) unawaited(_sharedPrefs.saveInt(USER_ID, r!.id));
        return true;
      },
    );
  }

  Future<bool> loginUser() async {
    try {
      setLoginState(loading: true);
      final result = await _authRepo.login(
        username: _loginState.nickname,
        password: _loginState.password,
      );

      setLoginState(loading: false);
      return result.fold(
        (l) {
          setLoginState(loading: false);
          return false;
        },
        (r) {
          if (r?.id != null) unawaited(_sharedPrefs.saveInt(USER_ID, r!.id));
          return true;
        },
      );
    } catch (e) {
      return false;
    }
  }

  void clearData() {
    _loginState = LoginState.initial();
    _registerState = RegisterState.initial();
    notifyListeners();
  }
}
