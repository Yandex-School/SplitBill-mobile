import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/home/data/datasources/room_remoute_datasource.dart';
import 'package:split_bill/features/home/data/datasources/user_remoute_datasource.dart';
import 'package:split_bill/features/home/data/models/room_model.dart';
import 'package:split_bill/features/home/domain/entities/room_entity.dart';
import 'package:split_bill/features/home/domain/repository/room_rep.dart';

class RoomRepositoryImpl implements RoomRepository {
  final RoomRemouteDatasource roomRemoteDatasource;

  RoomRepositoryImpl({required this.roomRemoteDatasource});

  @override
  Future<Either<Failure, List<RoomEntity>>> fetchAllRooms() async {
    try {
      final result = await roomRemoteDatasource.fetchAllRooms();
      final resultList = result
          .map(
            (model) => RoomEntity(
              id: model.id ?? 0,
              name: model.name ?? "No name",
              ownerId: model.ownerId ?? 0,
            ),
          )
          .toList();
      return Right(resultList);
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, RoomEntity>> fetchRoom() async {
    try {
      final result = await roomRemoteDatasource.fetchRoom();
      final room = RoomEntity(
        id: result.id ?? 0,
        name: result.name ?? "No name",
        ownerId: result.ownerId ?? 0,
      );
      return Right(room);
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, RoomEntity>> updateRoom(RoomEntity room) async{
    try {
      final mapper = RoomMapper();
      final result = await roomRemoteDatasource.updateRoom(room.toModel());
      return Right(mapper.mapperToEntity(result));
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}
