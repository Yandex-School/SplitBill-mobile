import 'package:json_annotation/json_annotation.dart';
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

  factory ProductModel.fromJson(Map<String, Object?> json) => _$ProductModelFromJson(json);
  Map<String, Object?> toJson() => _$ProductModelToJson(this);
}
