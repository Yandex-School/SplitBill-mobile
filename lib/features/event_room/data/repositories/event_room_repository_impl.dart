// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/event_room/data/datasources/event_room_remote_datasource.dart';
import 'package:split_bill/features/event_room/data/models/mappers/create_room_response_mapper.dart';
import 'package:split_bill/features/event_room/data/models/mappers/created_rooms_response_mapper.dart';
import 'package:split_bill/features/event_room/domain/entities/create_room_request_entity.dart';
import 'package:split_bill/features/event_room/domain/entities/create_room_response_entity.dart';
import 'package:split_bill/features/event_room/domain/entities/created_rooms_response_entity.dart';
import 'package:split_bill/features/event_room/domain/repository/event_room_repository.dart';

class EventRoomRepositoryImpl implements IEventRoomRepository {
  final EventRoomApi eventAPI;

  EventRoomRepositoryImpl({required this.eventAPI});

  @override
  Future<Either<Failure, CreateRoomResponseEntity>> createRoom(CreateRoomRequestEntity request) async {
    try {
      final response = await eventAPI.createRoom(loginRequest: request.toModel());
      return Right(CreateRoomMapper.mapper(response));
    } catch (e) {
      return const Left(InitFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> joinRoom(String idRoom) async {
    try {
      await eventAPI.joinRoom(id: idRoom);

      return const Right(true);
    } catch (e) {
      return const Left(InitFailure());
    }
  }

  @override
  Future<Either<Failure, CreatedRoomsResponseEntity>> getRooms() async {
    try {
      final response = await eventAPI.getRooms();

      return Right(CreatedRoomsResponseMapper.mapper(response));
    } catch (e) {
      log(e.toString());
      return const Left(InitFailure());
    }
  }
}
