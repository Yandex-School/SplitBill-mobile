import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:split_bill/features/event_room/data/models/create_room_response_model.dart';
import 'package:split_bill/features/event_room/data/models/created_rooms_response_model.dart';
import 'package:split_bill/features/room/data/models/create_room_request_model.dart';

part 'event_room_remote_datasource.g.dart';

@RestApi(baseUrl: 'https://split-bill.steamfest.live')
abstract class EventRoomApi {
  factory EventRoomApi(Dio dio, {String baseUrl}) = _EventRoomApi;

  @POST('/rooms')
  Future<CreateRoomResponseModel> createRoom({
    @Body() required CreateRoomRequestModel loginRequest,
  });

  @POST('/join/{id}')
  Future<void> joinRoom({@Path() required String id});

  @GET('/rooms/created/')
  Future<CreatedRoomsResponseModel> getRooms();
}
