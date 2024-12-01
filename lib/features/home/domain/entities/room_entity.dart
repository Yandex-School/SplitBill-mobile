import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_bill/features/home/data/models/room_model.dart';

part 'room_entity.freezed.dart';

@freezed
class RoomEntity with _$RoomEntity {
  const RoomEntity._();

  factory RoomEntity({
    required int id,
    required String? name,
    required int? ownerId,
  }) = _RoomEntity;

  RoomModel toModel() => RoomModel(
        id: id,
        name: name,
        ownerId: ownerId,
      );
}
