// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'room_users_response_model.g.dart';

@JsonSerializable()
class RoomUsersModelResponse {
  List<RoomUserModel> data;

  RoomUsersModelResponse({
    required this.data,
  });

  factory RoomUsersModelResponse.fromJson(Map<String, Object?> json) => _$RoomUsersModelResponseFromJson(json);

  Map<String, Object?> toJson() => _$RoomUsersModelResponseToJson(this);
}

@JsonSerializable()
class RoomUserModel {
  final int id;
  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'photo_url')
  final String photoUrl;
  final int amount;
  final List<RoomUserProductModel> products;

  RoomUserModel({
    required this.id,
    required this.fullName,
    required this.photoUrl,
    required this.amount,
    required this.products,
  });

  factory RoomUserModel.fromJson(Map<String, Object?> json) => _$RoomUserModelFromJson(json);

  Map<String, Object?> toJson() => _$RoomUserModelToJson(this);
}

@JsonSerializable()
class RoomUserProductModel {
  final int id;
  final String name;
  final int price;
  final String status;

  RoomUserProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.status,
  });

  factory RoomUserProductModel.fromJson(Map<String, Object?> json) => _$RoomUserProductModelFromJson(json);

  Map<String, Object?> toJson() => _$RoomUserProductModelToJson(this);
}
