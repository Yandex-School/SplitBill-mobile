// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      roomId: (json['roomId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'roomId': instance.roomId,
    };
