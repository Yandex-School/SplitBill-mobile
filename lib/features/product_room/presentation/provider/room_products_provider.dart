import 'package:flutter/cupertino.dart';
import 'package:split_bill/features/product_room/domain/room_product_entity.dart';
import 'package:split_bill/features/product_room/domain/room_products_tab_state.dart';

class RoomProductsProvider extends ChangeNotifier {
  RoomProductsTabState _productsTabState = RoomProductsTabState.initial();

  bool get isLoadingProducts => _productsTabState.isLoading;

  List<RoomProductEntity> get products => _productsTabState.products;

  void intiWithProducts(List<RoomProductEntity> products) {
    _productsTabState = _productsTabState.copyWith(products: products);
  }

  void _setProductsTabState({
    bool? isLoading,
    List<RoomProductEntity>? products,
  }) {
    _productsTabState = _productsTabState.copyWith(
      isLoading: isLoading ?? _productsTabState.isLoading,
      products: products ?? _productsTabState.products,
    );
    notifyListeners();
  }

  void addProduct({
    required String name,
    required int price,
    int? replacementIndex,
  }) {
    final newProduct = RoomProductEntity(
      name: name,
      price: price,
    );

    final newProducts = List<RoomProductEntity>.from(products);
    if (replacementIndex != null) {
      newProducts[replacementIndex] = newProduct;
    } else {
      newProducts.add(newProduct);
    }
    _setProductsTabState(products: newProducts);
  }

  void removeProduct(RoomProductEntity product) {
    final newProducts = List<RoomProductEntity>.from(products)..remove(product);
    _setProductsTabState(products: newProducts);
  }

  void clearProducts() {
    _setProductsTabState(products: []);
  }
}
