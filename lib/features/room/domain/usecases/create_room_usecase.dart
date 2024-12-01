import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/usecase/usecase.dart';
import 'package:split_bill/features/room/domain/entities/create_room_request_entity.dart';
import 'package:split_bill/features/room/domain/repository/create_room_repository.dart';

class CreateRoomUsecase extends UseCase<bool, CreateRoomRequestEntity> {
  final CreateRoomRepository createRoomRepository;

  CreateRoomUsecase(this.createRoomRepository);

  @override
  Future<Either<Failure, bool>> call(CreateRoomRequestEntity params) async {
    return await createRoomRepository.createRoom(createRoomRequest: params);
  }
}
