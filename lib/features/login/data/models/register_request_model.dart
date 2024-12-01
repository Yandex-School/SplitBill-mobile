import 'package:json_annotation/json_annotation.dart';

part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String username;
  final String password;
  final String fullName;
  final String? photoUrl;

  RegisterRequest({
    required this.username,
    required this.password,
    required this.fullName,
    this.photoUrl,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
