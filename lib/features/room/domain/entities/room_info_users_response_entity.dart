import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_bill/features/product_room/domain/entities/room_product_entity.dart';

part 'room_info_users_response_entity.freezed.dart';

@freezed
class RoominfoUsersResponseEntity with _$RoominfoUsersResponseEntity {
  const RoominfoUsersResponseEntity._();

  const factory RoominfoUsersResponseEntity({
    required List<RoomUsersEntity> data,
  }) = _RoominfoUsersResponseEntity;
}

@freezed
class RoomUsersEntity with _$RoomUsersEntity {
  const RoomUsersEntity._();

  const factory RoomUsersEntity({
    required int id,
    required String fullName,
    required String photoUrl,
    required int amount,
    required List<RoomUserProductsEntity> products,
  }) = _RoomUsersEntity;
}

@freezed
class RoomUserProductsEntity with _$RoomUserProductsEntity{
    const factory RoomUserProductsEntity({
      required int id,
      required String name,
      required int price,
      required String status,

    }) =_RoomUserProductsEntity;

}