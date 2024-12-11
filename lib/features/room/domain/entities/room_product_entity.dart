import 'package:freezed_annotation/freezed_annotation.dart';

part 'room_product_entity.freezed.dart';

@freezed
class RoomProductEntity with _$RoomProductEntity {
  const factory RoomProductEntity({
    required String name,
    required int price,
    int? id,
    int? roomId,
    @Default([]) final List<int> users,
  }) = _RoomProductEntity;
}