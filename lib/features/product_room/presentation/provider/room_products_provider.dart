import 'package:flutter/cupertino.dart';
import 'package:split_bill/features/product_room/domain/entities/room_product_entity.dart';
import 'package:split_bill/features/product_room/domain/entities/room_products_tab_state.dart';

class RoomProductsProvider extends ChangeNotifier {
  RoomProductsTabState _productsTabState = RoomProductsTabState.initial();

  bool get isLoadingProducts => _productsTabState.isLoading;

  List<Product> get products => _productsTabState.products;

  void intiWithProducts(List<Product> products) {
    _productsTabState = _productsTabState.copyWith(products: products);
  }

  void _setProductsTabState({
    bool? isLoading,
    List<Product>? products,
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
    List<int>? users,
  }) {
    final newProduct = Product(name: name, price: price, addUsers: users, status: "UNPAID");

    final newProducts = List<Product>.from(products);
    if (replacementIndex != null) {
      newProducts[replacementIndex] = newProduct;
    } else {
      newProducts.add(newProduct);
    }
    _setProductsTabState(products: newProducts);
  }

  void removeProduct(Product product) {
    final newProducts = List<Product>.from(products)..remove(product);
    _setProductsTabState(products: newProducts);
  }

  void clearProducts() {
    _setProductsTabState(products: []);
  }
}
