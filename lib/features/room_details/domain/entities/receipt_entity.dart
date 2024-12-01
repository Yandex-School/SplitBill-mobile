import 'package:split_bill/features/room_details/data/models/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_entity.freezed.dart';

@freezed
class ReceiptEntity with _$ReceiptEntity {
  const ReceiptEntity._();

  const factory ReceiptEntity({
    required List<ProductModel> products, 
  }) = _ReceiptEntity;
}
