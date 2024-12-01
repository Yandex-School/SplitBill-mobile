import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';

import '../entities/create_room_request_entity.dart';

abstract class CreateRoomRepository {
  Future<Either<Failure, bool>> createRoom({
    required CreateRoomRequestEntity createRoomRequest,
  });
}
