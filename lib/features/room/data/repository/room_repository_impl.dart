// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/room/data/datasources/room_remote_datasource.dart';
import 'package:split_bill/features/room/data/models/mappers/room_info_response_mapper.dart';
import 'package:split_bill/features/room/domain/entities/room_info_response_entity.dart';
import 'package:split_bill/features/room/domain/repository/room_repository.dart';

class RoomRepositoryImpl implements IRoomRepository {
  final RoomApi roomApi;

  RoomRepositoryImpl({required this.roomApi});
  @override
  Future<Either<Failure, RoomInfoResponseEntity>> getRoomInfoById(String roomId) async {
    try {
      final response = await roomApi.getRooms(id: roomId);
      if (response == null) {
        return const Left(InitFailure());
      }
      return Right(RoomMappers.roomInfoMapper(response));
    } catch (e) {
      return const Left(InitFailure());
    }
  }
}
