// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'room_info_response_model.g.dart';

@JsonSerializable()
class RoomInfoResponseModel {
  final int id;
  final String name;
  @JsonKey(name: 'user_id')
  final int userId;
  RoomInfoResponseModel({
    required this.id,
    required this.name,
    required this.userId,
  });

  factory RoomInfoResponseModel.fromJson(Map<String, Object?> json) => _$RoomInfoResponseModelFromJson(json);
  Map<String, Object?> toJson() => _$RoomInfoResponseModelToJson(this);
}
