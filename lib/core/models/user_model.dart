import 'package:json_annotation/json_annotation.dart';
import 'package:split_bill/core/mapper/mapper.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final int? id;
  final String? userName;
  final String? fullName;
  final String? photo;
  final String? password;

  UserModel({
    this.id,
    this.userName,
    this.fullName,
    this.photo,
    this.password,
  });

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
  Map<String, Object?> toJson() => _$UserModelToJson(this);
}
