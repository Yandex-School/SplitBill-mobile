import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/exeptions.dart';
import 'package:split_bill/features/room/data/models/create_room_request_model.dart';

abstract class CreateRoomRemoteDatasource {
  Future<Either<Exception, bool>> createRoom(
    CreateRoomRequestModel createRoomRequestModel,
  );
}

class CreateRoomRemoteDatasourceImpl implements CreateRoomRemoteDatasource {
  @override
  Future<Either<Exception, bool>> createRoom(
    CreateRoomRequestModel createRoomRequestModel,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      return const Right(true);
    } catch (e) {
      return left(ServerExeption(message: "Error mock in data"));
    }
  }
}
