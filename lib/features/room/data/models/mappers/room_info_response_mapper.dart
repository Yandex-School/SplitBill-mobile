import 'package:split_bill/features/product_room/domain/room_product_entity.dart';
import 'package:split_bill/features/room/data/models/room_info_response_model.dart';
import 'package:split_bill/features/room/domain/entities/room_info_response_entity.dart';

class RoomMappers {
  static RoomInfoResponseEntity roomInfoMapper(RoomInfoResponseModel model) =>
      RoomInfoResponseEntity(
        id: model.id,
        name: model.name,
        ownerId: model.ownerId,
        isActive: model.isActive,
        roomProducts: model.roomProducts.map((e) => roomProductMapper(e)).toList(),
        totalPrice: model.totalPrice,
        totalMembers: model.totalMembers,
      );

  static RoomProductEntity roomProductMapper(RoomProduct model) => RoomProductEntity(
        price: model.price.toInt(),
        id: model.id,
        name: model.name,
        users: model.userProducts.map((e) => e.userId).toList(),
        roomId: model.roomId,
      );
}
