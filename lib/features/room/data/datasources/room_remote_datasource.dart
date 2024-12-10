import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:split_bill/features/room/data/models/room_info_response_model.dart';
import 'package:split_bill/features/room/data/models/room_update_request_model.dart';
import 'package:split_bill/features/room/data/models/room_users_response_model.dart';

part 'room_remote_datasource.g.dart';

@RestApi(baseUrl: 'https://split-bill.steamfest.live')
abstract class RoomApi {
  factory RoomApi(Dio dio, {String baseUrl}) = _RoomApi;

  @GET('/v1/rooms/{id}')
  Future<RoomInfoResponseModel?> getRooms({
    @Path() required String id,
  });

  @PUT('/v1/rooms/{id}')
  Future<RoomInfoResponseModel> updateRoom({
    @Path() required String id,
    @Body() required RoomUpdateRequestModel updateRequest,
  });

  @GET('/v1/rooms/{id}/calculate')
  Future<RoomUsersModelResponse> getRoomUsers({
    @Path() required String id,
  });
}
