import 'package:split_bill/core/mapper/mapper.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_products_model.g.dart';

@JsonSerializable()
class UserProducsModel {
  final int? id;
  final PaidStatus? status;
  final int? productId;
  final int? userId;

  UserProducsModel({this.id, this.productId, this.status, this.userId});

  factory UserProducsModel.fromJson(Map<String, Object?> json) => _$UserProducsModelFromJson(json);

  Map<String, Object?> toJson() => _$UserProducsModelToJson(this);
}

enum PaidStatus {
  initial,
  paid,
  unpaid,
}
