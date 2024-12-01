import 'package:json_annotation/json_annotation.dart';
import 'package:split_bill/core/mapper/mapper.dart';
import 'package:split_bill/features/room_details/domain/entities/product_entity.dart';
part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  final int? id;
  final String? name;
  final double? price;
  final int? roomId;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.roomId,
  });

  factory ProductModel.fromJson(Map<String, Object?> json) =>
      _$ProductModelFromJson(json);
  Map<String, Object?> toJson() => _$ProductModelToJson(this);
}

class ProductMapper
    extends UiEntityToDataModelMapper<ProductEntity, ProductModel> {
  @override
  mapperToDataModel(entity) {
    return ProductModel(
        id: entity.id,
        name: entity.name,
        price: entity.price,
        roomId: entity.roomId);
  }

  @override
  mapperToEntity(model) {
    return ProductEntity(
      id: model.id!,
      name: model.name!,
      price: model.price,
      roomId: model.roomId!,
    );
  }
}
