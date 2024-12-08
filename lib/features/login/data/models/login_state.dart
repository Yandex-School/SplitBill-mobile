import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const LoginState._();
  const factory LoginState({
    required String nickname,
    required String password,
    required bool showPassword,
    required bool showConfirmPassword,
    required bool loading,
  }) = _LoginState;

  factory LoginState.initial() => const LoginState(
        nickname: '',
        password: '',
        showPassword: true,
        showConfirmPassword: true,
        loading: false,
      );

  bool get fieldsAreValid => nickname.isNotEmpty && password.isNotEmpty;
}
