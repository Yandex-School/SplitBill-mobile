import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:split_bill/features/room/data/models/room_update_request_model.dart';

part 'room_products_datasource.g.dart';

@RestApi(baseUrl: 'https://split-bill.steamfest.live')
abstract class RoomProductsApi {
  factory RoomProductsApi(Dio dio, {String baseUrl}) = _RoomProductsApi;

  @PUT('/v1/rooms/{id}')
  Future<dynamic> updateRoomProducts({
    @Path() required String id,
    @Body() required RoomUpdateRequestModel updateRequest,
  });
}
