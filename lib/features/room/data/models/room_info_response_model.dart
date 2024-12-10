// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'room_info_response_model.g.dart';

@JsonSerializable()
class RoomInfoResponseModel {
  final int id;
  final String name;
  @JsonKey(name: 'owner_id')
  final int ownerId;
  @JsonKey(name: 'room_products')
  final List<RoomProduct> roomProducts;
  @JsonKey(name: 'total_price')
  final double totalPrice;
  @JsonKey(name: 'total_members')
  final int totalMembers;
  @JsonKey(name: 'room_status')
  final String roomStatus;

  RoomInfoResponseModel({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.roomProducts,
    required this.totalPrice,
    required this.totalMembers,
    required this.roomStatus,
  });

  factory RoomInfoResponseModel.fromJson(Map<String, Object?> json) => _$RoomInfoResponseModelFromJson(json);

  Map<String, Object?> toJson() => _$RoomInfoResponseModelToJson(this);
}

@JsonSerializable()
class RoomProduct {
  final int id;
  final String name;
  final double price;
  @JsonKey(name: 'room_id')
  final int roomId;
  @JsonKey(name: 'user_products')
  final List<UserProductModel> userProducts;

  RoomProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.roomId,
    required this.userProducts,
  });

  factory RoomProduct.fromJson(Map<String, dynamic> json) => _$RoomProductFromJson(json);

  Map<String, dynamic> toJson() => _$RoomProductToJson(this);
}

@JsonSerializable()
class UserProductModel {
  final int id;
  final String status;
  @JsonKey(name: 'product_id')
  final int productId;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'full_name')
  final String fullName;
  @JsonKey(name: 'photo_url')
  final String photoUrl;

  UserProductModel({
    required this.id,
    required this.status,
    required this.productId,
    required this.userId,
    required this.fullName,
    required this.photoUrl,
  });

  factory UserProductModel.fromJson(Map<String, dynamic> json) => _$UserProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserProductModelToJson(this);
}
