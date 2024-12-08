import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/event_room/domain/entities/create_room_request_entity.dart';
import 'package:split_bill/features/event_room/domain/entities/create_room_response_entity.dart';
import 'package:split_bill/features/event_room/domain/entities/created_rooms_response_entity.dart';

abstract interface class IEventRoomRepository {
  Future<Either<Failure, CreateRoomResponseEntity>> createRoom(CreateRoomRequestEntity request);
  Future<Either<Failure, bool>> joinRoom(String idRoom);
  Future<Either<Failure, CreatedRoomsResponseEntity>> getRooms();
}
