import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/product_room/domain/repository/room_products_repository.dart';
import 'package:split_bill/features/room/domain/entities/room_update_request_entity.dart';

class RoomProductsRepository implements IRoomProductsRepository {
  @override
  Future<Either<Failure, dynamic>> updateRoomProducts({
    required String roomId,
    required RoomUpdateRequestEntity updateRequest,
  }) async {
    return const Right(null);
  }
}
