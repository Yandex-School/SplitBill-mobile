// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_room_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRoomResponseModel _$CreateRoomResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreateRoomResponseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateRoomResponseModelToJson(
        CreateRoomResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'userId': instance.userId,
    };
