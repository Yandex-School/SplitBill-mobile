import 'package:split_bill/features/event_room/data/models/create_room_response_model.dart';
import 'package:split_bill/features/event_room/domain/entities/create_room_response_entity.dart';

class CreateRoomMapper {
  static CreateRoomResponseEntity mapper(CreateRoomResponseModel model) =>
      CreateRoomResponseEntity(id: model.id, name: model.name, userId: model.userId);
}
