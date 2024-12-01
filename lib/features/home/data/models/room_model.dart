import 'package:json_annotation/json_annotation.dart';
import 'package:split_bill/core/mapper/mapper.dart';
import 'package:split_bill/features/home/domain/entities/room_entity.dart';
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

class RoomMapper extends UiEntityToDataModelMapper<RoomEntity, RoomModel> {
  @override
  mapperToDataModel(entity) {
    return RoomModel(id: entity.id, name: entity.name, ownerId: entity.ownerId);
  }

  @override
  mapperToEntity(model) {
    return RoomEntity(id: model.id!, name: model.name, ownerId: model.ownerId);
  }
}
