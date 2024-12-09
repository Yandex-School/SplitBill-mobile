import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/room/domain/entities/room_update_request_entity.dart';

abstract class IRoomProductsRepository {
  Future<Either<Failure, dynamic>> updateRoomProducts({
    required String roomId,
    required RoomUpdateRequestEntity updateRequest,
  });
}
