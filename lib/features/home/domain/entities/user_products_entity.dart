import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_bill/core/models/user_products_model.dart';

part 'user_products_entity.freezed.dart';

@freezed
class UserProductsEntity with _$UserProductsEntity {
  const UserProductsEntity._();

  const factory UserProductsEntity({
    required int id,
    required PaidStatus status,
    required int productId,
    required int userId,
  }) = _UserProductsEntity;
}
