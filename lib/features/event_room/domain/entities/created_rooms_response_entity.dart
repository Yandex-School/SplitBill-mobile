import 'package:freezed_annotation/freezed_annotation.dart';

part 'created_rooms_response_entity.freezed.dart';

@freezed
class CreatedRoomsResponseEntity with _$CreatedRoomsResponseEntity {
  const CreatedRoomsResponseEntity._();

  factory CreatedRoomsResponseEntity({
    required List<CreatedRoomsResponseItemsEntity> items,
    required int page,
    required int limit,
    required int totalCount,
    required int totalPage,
  }) = _CreatedRoomsResponseEntity;
}

@freezed
class CreatedRoomsResponseItemsEntity with _$CreatedRoomsResponseItemsEntity {
  const CreatedRoomsResponseItemsEntity._();

  factory CreatedRoomsResponseItemsEntity({
    required int id,
    required String name,
    required int userId,
  }) = _CreatedRoomsResponseItemsEntity;
}
