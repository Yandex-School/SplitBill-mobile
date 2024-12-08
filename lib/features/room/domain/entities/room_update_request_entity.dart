import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_update_request_entity.freezed.dart';

@freezed
class RoomUpdateRequestEntity with _$RoomUpdateRequestEntity {
  const RoomUpdateRequestEntity._();

  const factory RoomUpdateRequestEntity({
    required String name,
  }) = _RoomUpdateRequestEntity;
}
