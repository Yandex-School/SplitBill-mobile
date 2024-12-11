// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:json_annotation/json_annotation.dart';

part 'product_update_request_model.g.dart';

@JsonSerializable()
class ProductUpdateRequestModel {
  final ProductsUpdateModel product;

  ProductUpdateRequestModel({required this.product});

  factory ProductUpdateRequestModel.fromJson(Map<String, Object?> json) => _$ProductUpdateRequestModelFromJson(json);

  Map<String, Object?> toJson() => _$ProductUpdateRequestModelToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ProductsUpdateModel {
  final List<UpdateProductItemModel>? add;
  final List<UpdateProductItemModel>? edit;

  ProductsUpdateModel({
    this.add,
    this.edit,
  });

  factory ProductsUpdateModel.fromJson(Map<String, Object?> json) => _$ProductsUpdateModelFromJson(json);

  Map<String, Object?> toJson() => _$ProductsUpdateModelToJson(this);
}

@JsonSerializable()
class UpdateProductItemModel {
  final String name;
  final int price;
  final String status;
  @JsonKey(name: 'add_users')
  final List<int>? usersId;
  UpdateProductItemModel({
    required this.name,
    required this.price,
    required this.status,
    required this.usersId,
  });
  factory UpdateProductItemModel.fromJson(Map<String, Object?> json) => _$UpdateProductItemModelFromJson(json);

  Map<String, Object?> toJson() => _$UpdateProductItemModelToJson(this);
}
