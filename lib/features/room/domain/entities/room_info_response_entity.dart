import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_info_response_entity.freezed.dart';

@freezed
class RoomInfoResponseEntity with _$RoomInfoResponseEntity {
  const RoomInfoResponseEntity._();

  const factory RoomInfoResponseEntity({
    required int id,
    required String name,
    required int userId,
  }) = _RoomInfoResponseEntity;
}
