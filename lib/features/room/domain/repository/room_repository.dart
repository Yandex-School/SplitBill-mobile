import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/room/domain/entities/room_info_response_entity.dart';
import 'package:split_bill/features/room/domain/entities/room_info_users_response_entity.dart';

abstract interface class IRoomRepository {
  Future<Either<Failure, RoomInfoResponseEntity>> getRoomInfoById(String roomId);
  Future<Either<Failure, RoominfoUsersResponseEntity>> getRoomUsers(String roomId);
}
