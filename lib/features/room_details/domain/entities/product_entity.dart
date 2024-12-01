import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_bill/features/room_details/data/models/product_model.dart';

part 'product_entity.freezed.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const ProductEntity._();

  const factory ProductEntity({
    required int id,
    required String name,
    required double? price,
    required int roomId,
  }) = _ProductEntity;

  ProductModel toModel() => ProductModel(
        id: id,
        name: name,
        price: price,
        roomId: roomId,
      );
}
