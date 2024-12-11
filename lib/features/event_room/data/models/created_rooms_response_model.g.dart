// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_rooms_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedRoomsResponseModel _$CreatedRoomsResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreatedRoomsResponseModel(
      (json['page'] as num).toInt(),
      (json['limit'] as num).toInt(),
      (json['total_count'] as num).toInt(),
      (json['total_pages'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map(
              (e) => CreatedRoomsItemsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreatedRoomsResponseModelToJson(
        CreatedRoomsResponseModel instance) =>
    <String, dynamic>{
      'items': instance.items,
      'page': instance.page,
      'limit': instance.limit,
      'total_count': instance.totalCount,
      'total_pages': instance.totalPages,
    };

CreatedRoomsItemsModel _$CreatedRoomsItemsModelFromJson(
        Map<String, dynamic> json) =>
    CreatedRoomsItemsModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      userId: (json['owner_id'] as num).toInt(),
    );

Map<String, dynamic> _$CreatedRoomsItemsModelToJson(
        CreatedRoomsItemsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'owner_id': instance.userId,
    };
