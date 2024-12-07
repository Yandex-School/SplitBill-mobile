import 'package:split_bill/features/event_room/data/models/created_rooms_response_model.dart';
import 'package:split_bill/features/event_room/domain/entities/created_rooms_response_entity.dart';

class CreatedRoomsResponseMapper {
  static CreatedRoomsResponseEntity mapper(CreatedRoomsResponseModel model) =>
      CreatedRoomsResponseEntity(items: model.items.map((item) => _itemsMapper(item)).toList());

  static CreatedRoomsResponseItemsEntity _itemsMapper(CreatedRoomsItemsModel model) =>
      CreatedRoomsResponseItemsEntity(id: model.id, name: model.name, userId: model.userId);
}
