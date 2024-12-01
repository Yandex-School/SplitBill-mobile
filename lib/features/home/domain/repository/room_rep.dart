import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/home/domain/entities/room_entity.dart';

abstract class RoomRepository {
  Future<Either<Failure, RoomEntity>> fetchRoom();
  Future<Either<Failure, List<RoomEntity>>> fetchAllRooms();
  Future<Either<Failure, RoomEntity>> updateRoom(RoomEntity room);
}