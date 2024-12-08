import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const RegisterState._();

  const factory RegisterState({
    required String nickname,
    required String password,
    required String confirmPassword,
    required bool showPassword,
    required bool showConfirmPassword,
    required bool loading,
  }) = _RegisterState;

  factory RegisterState.initial() => const RegisterState(
        nickname: '',
        password: '',
        confirmPassword: '',
        showPassword: true,
        showConfirmPassword: true,
        loading: false,
      );

  bool get isPasswordMatch => password != confirmPassword;

  bool get fieldsAreValid =>
      nickname.isNotEmpty && password.isNotEmpty && confirmPassword.isNotEmpty && isPasswordMatch;
}
