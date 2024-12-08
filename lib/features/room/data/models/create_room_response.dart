import 'package:json_annotation/json_annotation.dart';

part 'create_room_response.g.dart';

@JsonSerializable()
class CreateRoomResponse {
  final int id;
  final String name;
  final int ownerId;
  final bool? isActive;
  final List<RoomProduct> roomProducts;
  final double totalPrice;
  final int totalMembers;

  CreateRoomResponse({
    required this.id,
    required this.name,
    required this.ownerId,
    required this.isActive,
    required this.roomProducts,
    required this.totalPrice,
    required this.totalMembers,
  });

  factory CreateRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRoomResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateRoomResponseToJson(this);
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
