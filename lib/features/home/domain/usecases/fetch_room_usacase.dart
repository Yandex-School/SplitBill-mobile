import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/usecase/usecase.dart';
import 'package:split_bill/features/home/domain/entities/room_entity.dart';
import 'package:split_bill/features/home/domain/repository/room_rep.dart';

class FetchRoomUsacese extends UseCase<RoomEntity, NoParams> {
  RoomRepository roomRepository;
  FetchRoomUsacese(this.roomRepository);
  @override
  Future<Either<Failure, RoomEntity>> call(NoParams params) async {
    return await roomRepository.fetchRoom();
  }
}
