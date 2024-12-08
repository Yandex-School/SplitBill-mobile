import 'package:split_bill/features/room/data/models/room_info_response_model.dart';
import 'package:split_bill/features/room/domain/entities/room_info_response_entity.dart';

class RoomMappers {
  static RoomInfoResponseEntity roomInfoMapper(RoomInfoResponseModel model) =>
      RoomInfoResponseEntity(id: model.id, name: model.name, userId: model.userId);
}
