import 'package:json_annotation/json_annotation.dart';
part 'room_model.g.dart';

@JsonSerializable()
class RoomModel {
  final int? id;
  final String? name;
  final int? ownerId;

  RoomModel({this.id, this.name, this.ownerId});

  factory RoomModel.fromJson(Map<String, Object?> json) =>
      _$RoomModelFromJson(json);
  Map<String, Object?> toJson() => _$RoomModelToJson(this);
}
