import 'package:json_annotation/json_annotation.dart';
import 'package:split_bill/core/mapper/mapper.dart';
import 'package:split_bill/features/home/domain/entities/user_products_entity.dart';
part 'user_products_model.g.dart';

@JsonSerializable()
class UserProducsModel {
  final int? id;
  final PaidStatus? status;
  final int? productId;
  final int? userId;

  UserProducsModel({this.id, this.productId, this.status, this.userId});

  factory UserProducsModel.fromJson(Map<String, Object?> json) =>
      _$UserProducsModelFromJson(json);

  Map<String, Object?> toJson() => _$UserProducsModelToJson(this);
}

class UserProductsMapper
    extends UiEntityToDataModelMapper<UserProductsEntity, UserProducsModel> {
  @override
  mapperToDataModel(entity) {
    return UserProducsModel(
      id: entity.id,
      productId: entity.productId,
      status: entity.status,
      userId: entity.userId,
    );
  }

  @override
  mapperToEntity(model) {
    return UserProductsEntity(
      id: model.id!,
      status: model.status!,
      productId: model.productId!,
      userId: model.userId!,
    );
  }
}

enum PaidStatus {
  initial,
  paid,
  unpaid,
}
