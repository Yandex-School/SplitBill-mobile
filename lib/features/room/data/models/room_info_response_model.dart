// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'room_info_response_model.g.dart';

@JsonSerializable()
class RoomInfoResponseModel {
  final int id;
  final String name;
  final int ownerId;
  final bool? isActive;
  final List<RoomProduct> roomProducts;
  final double totalPrice;
  final int totalMembers;

  RoomInfoResponseModel({
    required this.id,
    required this.name,
    required this.ownerId,
    this.isActive,
    required this.roomProducts,
    required this.totalPrice,
    required this.totalMembers,
  });

  factory RoomInfoResponseModel.fromJson(Map<String, Object?> json) =>
      _$RoomInfoResponseModelFromJson(json);

  Map<String, Object?> toJson() => _$RoomInfoResponseModelToJson(this);
}

@JsonSerializable()
class RoomProduct {
  final int id;
  final String name;
  final double price;
  final int roomId;
  final List<UserProduct> userProducts;

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
class UserProduct {
  final int id;
  final String status;
  final int productId;
  final int userId;
  final String fullName;
  final String photoUrl;

  UserProduct({
    required this.id,
    required this.status,
    required this.productId,
    required this.userId,
    required this.fullName,
    required this.photoUrl,
  });

  factory UserProduct.fromJson(Map<String, dynamic> json) => _$UserProductFromJson(json);

  Map<String, dynamic> toJson() => _$UserProductToJson(this);
}
