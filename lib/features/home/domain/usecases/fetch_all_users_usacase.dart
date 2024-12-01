import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/usecase/usecase.dart';
import 'package:split_bill/features/home/domain/entities/user_entity.dart';
import 'package:split_bill/features/home/domain/repository/user_rep.dart';

class FetchAllUsersUsacase extends UseCase<List<UserEntity>, NoParams> {
  UserRepository userRepository;
  FetchAllUsersUsacase(this.userRepository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParams params) async {
    return await userRepository.fetchAllUsers();
  }
}
