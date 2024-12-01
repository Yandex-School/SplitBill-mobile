import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});

  factory LoginRequest.fromJson(Map<String, Object?> json) => _$LoginRequestFromJson(json);

  Map<String, Object?> toJson() => _$LoginRequestToJson(this);
}
