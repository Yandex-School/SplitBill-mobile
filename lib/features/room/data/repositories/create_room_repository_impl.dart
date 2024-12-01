import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/room/data/darasources/create_room_request_remoute.dart';
import 'package:split_bill/features/room/data/models/create_room_request_model.dart';
import 'package:split_bill/features/room/domain/entities/create_room_request_entity.dart';
import 'package:split_bill/features/room/domain/repositories/create_room_repository.dart';

class CreateRoomRepositoryImpl implements CreateRoomRepository {
  final CreateRoomRemoteDatasource createRoomRemoteDatasource;

  CreateRoomRepositoryImpl({required this.createRoomRemoteDatasource});

  @override
  Future<Either<Failure, bool>> createRoom({
    required CreateRoomRequestEntity createRoomRequest,
  }) async {
    try {
      final createRoomRequestModel = CreateRoomRequestModel(
        name: createRoomRequest.name,
        ownerId: createRoomRequest.ownerId,
      );

      final result = await createRoomRemoteDatasource.createRoom(
        createRoomRequestModel,
      );

      return result.fold(
        (failure) => const Left(ServerFailure()),
        (success) => Right(success),
      );
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}
