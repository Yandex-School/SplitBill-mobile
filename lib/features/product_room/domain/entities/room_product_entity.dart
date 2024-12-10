import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_bill/features/product_room/data/models/product_update_request_model.dart';

part 'room_product_entity.freezed.dart';

@freezed
class Room with _$Room {
  const  Room._();

  const factory Room({
    required String name,
  }) = _Room;
}

@Freezed()
class Product with _$Product {
  const Product._();
  const factory Product({
    required String name,
    required int price,
    required String status,
    List<int>? addUsers,
  }) = _Product;

  toModel() => UpdateProductItemModel(name: name, price: price, status: status, usersId: addUsers);
}

@freezed
class ProductActions with _$ProductActions {
 const  ProductActions._();
  const factory ProductActions({
    List<Product>? add,
    List<Product>? edit,
  }) = _ProductActions;

  toModel() => ProductsUpdateModel(add: add?.map<UpdateProductItemModel>((e) => e.toModel()).toList());
}

@freezed
class UpdateProductData with _$UpdateProductData {
  const  UpdateProductData._();
  const factory UpdateProductData({
    Room? room,
    ProductActions? product,
  }) = _UpdateProductData;

  toModel() => ProductUpdateRequestModel(product: product?.toModel());
}
