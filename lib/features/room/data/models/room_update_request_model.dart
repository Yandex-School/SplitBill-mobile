// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'room_update_request_model.g.dart';

@JsonSerializable()
class RoomUpdateRequestModel {
  final String name;
  RoomUpdateRequestModel({
    required this.name,
  });

  factory RoomUpdateRequestModel.fromJson(Map<String, Object?> json) => _$RoomUpdateRequestModelFromJson(json);
  Map<String, Object?> toJson() => _$RoomUpdateRequestModelToJson(this);
}
