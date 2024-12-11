import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:split_bill/features/product_room/domain/entities/room_product_entity.dart';

part 'room_products_tab_state.freezed.dart';

@freezed
class RoomProductsTabState with _$RoomProductsTabState {
  const factory RoomProductsTabState({
    required bool isLoading,
    required List<Product> products,
  }) = _RoomProductsTabState;

  factory RoomProductsTabState.initial() => const RoomProductsTabState(
        isLoading: false,
        products: [],
      );
}
