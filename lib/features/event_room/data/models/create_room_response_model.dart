import 'package:json_annotation/json_annotation.dart';

part 'create_room_response_model.g.dart';

@JsonSerializable()
class CreateRoomResponseModel {
  final int id;
  final String? name;
  final int? userId;

  CreateRoomResponseModel({
    required this.id,
    required this.name,
    required this.userId,
  });

  factory CreateRoomResponseModel.fromJson(Map<String, Object?> json) => _$CreateRoomResponseModelFromJson(json);

  Map<String, Object?> toJson() => _$CreateRoomResponseModelToJson(this);
}
