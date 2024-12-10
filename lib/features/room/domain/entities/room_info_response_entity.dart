import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_bill/features/room/domain/entities/room_product_entity.dart';

part 'room_info_response_entity.freezed.dart';

@freezed
class RoomInfoResponseEntity with _$RoomInfoResponseEntity {
  const RoomInfoResponseEntity._();

  const factory RoomInfoResponseEntity({
    required int id,
    required String name,
    required int ownerId,
    required List<RoomProductEntity> roomProducts,
    required double totalPrice,
    required int totalMembers,
  }) = _RoomInfoResponseEntity;
}
