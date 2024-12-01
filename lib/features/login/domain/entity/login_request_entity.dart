import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_request_entity.freezed.dart';

@freezed
class LoginRequestEntity with _$LoginRequestEntity {
  const factory LoginRequestEntity({
    required String username,
    required String password,
  }) = _LoginRequestEntity;
}
