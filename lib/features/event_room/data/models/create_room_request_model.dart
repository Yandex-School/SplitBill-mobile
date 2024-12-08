import 'package:json_annotation/json_annotation.dart';
part 'create_room_request_model.g.dart';

@JsonSerializable()
class CreateRoomRequestModel {
  final String name;

  CreateRoomRequestModel({required this.name});

  factory CreateRoomRequestModel.fromJson(Map<String, Object?> json) => _$CreateRoomRequestModelFromJson(json);

  Map<String, Object?> toJson() => _$CreateRoomRequestModelToJson(this);
}
