import 'package:json_annotation/json_annotation.dart';
import 'package:split_bill/features/room/data/models/product_model.dart';

part 'receipt_model.g.dart';

@JsonSerializable()
class ReceiptModel {
  final List<ProductModel>? products;

  ReceiptModel({this.products});

  factory ReceiptModel.fromJson(Map<String, Object?> json) =>
      _$ReceiptModelFromJson(json);

  Map<String, Object?> toJson() => _$ReceiptModelToJson(this);
}
