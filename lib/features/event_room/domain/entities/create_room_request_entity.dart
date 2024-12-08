import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_bill/features/event_room/data/models/create_room_request_model.dart';


part 'create_room_request_entity.freezed.dart';

@freezed
class CreateRoomRequestEntity with _$CreateRoomRequestEntity {
  const CreateRoomRequestEntity._();

  factory CreateRoomRequestEntity({
    required String name,
  }) = _CreateRoomRequestEntity;

  CreateRoomRequestModel toModel() => CreateRoomRequestModel(name: name);
}
