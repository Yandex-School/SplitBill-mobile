import 'package:freezed_annotation/freezed_annotation.dart';

part 'created_rooms_response_model.g.dart';

@JsonSerializable()
class CreatedRoomsResponseModel {
  final List<CreatedRoomsItemsModel> items;
  final int page;
  final int limit;
  @JsonKey(name: 'total_count')
  final int totalCount;
  @JsonKey(name: 'total_pages')
  final int totalPages;

  CreatedRoomsResponseModel(this.page, this.limit, this.totalCount, this.totalPages, {required this.items});

  factory CreatedRoomsResponseModel.fromJson(Map<String, Object?> json) => _$CreatedRoomsResponseModelFromJson(json);

  Map<String, Object?> toJson() => _$CreatedRoomsResponseModelToJson(this);
}

@JsonSerializable()
class CreatedRoomsItemsModel {
  final int id;
  final String name;
  @JsonKey(name: 'owner_id')
  final int userId;

  CreatedRoomsItemsModel({required this.id, required this.name, required this.userId});

  factory CreatedRoomsItemsModel.fromJson(Map<String, Object?> json) => _$CreatedRoomsItemsModelFromJson(json);

  Map<String, Object?> toJson() => _$CreatedRoomsItemsModelToJson(this);
}
