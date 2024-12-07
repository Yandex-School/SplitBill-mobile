import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    required String email,
    required String password,
    required bool isValidEmail,
    required bool isValidPassword,
    required bool showPassword,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
        email: '',
        password: '',
        isValidEmail: true,
        isValidPassword: true,
        showPassword: true,
      );
}
