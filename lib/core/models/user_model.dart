import 'package:json_annotation/json_annotation.dart';
import 'package:split_bill/core/mapper/mapper.dart';
import 'package:split_bill/features/home/domain/entities/user_entity.dart';

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

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
  Map<String, Object?> toJson() => _$UserModelToJson(this);
}

class UserMapper extends UiEntityToDataModelMapper<UserEntity, UserModel> {
  @override
  mapperToDataModel(entity) {
    return UserModel(
      id: entity.id,
      userName: entity.userName,
      fullName: entity.fullName,
      photo: entity.photo,
      password: entity.password,
    );
  }

  @override
  mapperToEntity(model) {
    return UserEntity(
        id: model.id!,
        userName: model.userName!,
        fullName: model.fullName!,
        photo: model.photo!,
        password: model.password!);
  }
}
