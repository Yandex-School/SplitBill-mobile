// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_room_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRoomRequestModel _$CreateRoomRequestModelFromJson(
        Map<String, dynamic> json) =>
    CreateRoomRequestModel(
      name: json['name'] as String?,
      ownerId: (json['ownerId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CreateRoomRequestModelToJson(
        CreateRoomRequestModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ownerId': instance.ownerId,
    };
