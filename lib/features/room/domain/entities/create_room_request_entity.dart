import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_room_request_entity.freezed.dart';

@freezed
class CreateRoomRequestEntity with _$CreateRoomRequestEntity {
  const CreateRoomRequestEntity._();

  const factory CreateRoomRequestEntity({
    required String name,
    required int ownerId,
  }) = _CreateRoomRequestEntity;
}
