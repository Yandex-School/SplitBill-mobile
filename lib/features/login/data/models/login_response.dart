import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final int? id;

  LoginResponse({this.id});

  factory LoginResponse.fromJson(Map<String, Object?> json) => _$LoginResponseFromJson(json);

  Map<String, Object?> toJson() => _$LoginResponseToJson(this);
}
