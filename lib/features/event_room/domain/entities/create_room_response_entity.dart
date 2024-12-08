import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_room_response_entity.freezed.dart';

@freezed
class CreateRoomResponseEntity with _$CreateRoomResponseEntity {
  const CreateRoomResponseEntity._();

  factory CreateRoomResponseEntity({
    required int id,
    required String? name,
    required int? userId,
  }) = _CreateRoomResponseEntity;
}
