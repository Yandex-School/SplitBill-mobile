import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_bill/features/room_details/domain/entities/product_entity.dart';

part 'create_room_request_entity.freezed.dart';

@freezed
class CreateRoomRequestEntity with _$CreateRoomRequestEntity {
  const CreateRoomRequestEntity._();
  
  const factory CreateRoomRequestEntity({
    required String name,
    required int ownerId,
    List<ProductEntity>? products,
  }) = _CreateRoomRequestEntity;
}
