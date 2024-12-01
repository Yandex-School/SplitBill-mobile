import 'package:split_bill/core/errors/exeptions.dart';
import 'package:split_bill/features/room_details/data/models/product_model.dart';

abstract class IProductDatasources {
  Future<bool> createProducts(List<ProductModel> pruducts);
  Future<bool> createProduct(ProductModel product);
  Future<ProductModel> updateProduct(ProductModel product);
  Future<void> deleteProduct(int id);
}

class ProductDatasourcesImpl extends IProductDatasources {
  @override
  Future<bool> createProduct(ProductModel product) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      return true;
    } catch (e) {
      throw ServerExeption(message: 'connection time out');
    }
  }

  @override
  Future<bool> createProducts(List<ProductModel> pruducts) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      return true;
    } catch (e) {
      throw ServerExeption(message: 'connection time out');
    }
  }

  @override
  Future<void> deleteProduct(int id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      return;
    } catch (e) {
      throw ServerExeption(message: 'connection time out');
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      final mockUpdatedProduct =
          ProductModel(id: 1, name: "Product Updated", price: 200, roomId: 2);
      return mockUpdatedProduct;
    } catch (e) {
      throw ServerExeption(message: 'connection time out');
    }
  }
}
