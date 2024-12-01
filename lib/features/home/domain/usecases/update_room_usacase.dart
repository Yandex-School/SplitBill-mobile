import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/usecase/usecase.dart';
import 'package:split_bill/features/home/domain/entities/room_entity.dart';
import 'package:split_bill/features/home/domain/repository/room_rep.dart';

class UpdateRoomUsacase extends UseCase<RoomEntity, RoomEntity> {
  RoomRepository roomRepository;
  UpdateRoomUsacase(this.roomRepository);

  @override
  Future<Either<Failure, RoomEntity>> call(RoomEntity params) async {
    return await roomRepository.updateRoom(params);
  }
}
