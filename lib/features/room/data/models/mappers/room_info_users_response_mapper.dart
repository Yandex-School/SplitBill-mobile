import 'package:split_bill/features/room/data/models/room_users_response_model.dart';
import 'package:split_bill/features/room/domain/entities/room_info_users_response_entity.dart';

class RoomInfoUsersResponseMapper {
  static RoominfoUsersResponseEntity mapper(RoomUsersModelResponse model) =>
      RoominfoUsersResponseEntity(data: model.data.map((e) => _usersMapper(e)).toList());

  static RoomUsersEntity _usersMapper(RoomUserModel model) => RoomUsersEntity(
      id: model.id,
      fullName: model.fullName,
      photoUrl: model.photoUrl,
      amount: model.amount,
      products: model.products.map((e) => _productMapper(e)).toList());

  static RoomUserProductsEntity _productMapper(RoomUserProductModel model) =>
      RoomUserProductsEntity(id: model.id, name: model.name, price: model.price, status: model.status);
}
