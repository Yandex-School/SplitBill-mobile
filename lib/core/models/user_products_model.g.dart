// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProducsModel _$UserProducsModelFromJson(Map<String, dynamic> json) =>
    UserProducsModel(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['productId'] as num?)?.toInt(),
      status: $enumDecodeNullable(_$PaidStatusEnumMap, json['status']),
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserProducsModelToJson(UserProducsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$PaidStatusEnumMap[instance.status],
      'productId': instance.productId,
      'userId': instance.userId,
    };

const _$PaidStatusEnumMap = {
  PaidStatus.initial: 'initial',
  PaidStatus.paid: 'paid',
  PaidStatus.unpaid: 'unpaid',
};
