import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/home/data/datasources/user_remoute_datasource.dart';
import 'package:split_bill/features/home/domain/entities/user_entity.dart';
import 'package:split_bill/features/home/domain/repository/user_rep.dart';

class UserRepositoryImpl extends UserRepository {
  final UserDataSource userDataSource;

  UserRepositoryImpl({required this.userDataSource});

  @override
  Future<Either<Failure, List<UserEntity>>> fetchAllUsers() async {
    try {
      final result = await userDataSource.fetchUsersData();
      final userData = result
          .map(
            (model) => UserEntity(
              id: model.id ?? 0,
              userName: model.userName ?? '',
              fullName: model.fullName ?? '',
              photo: model.photo ?? '',
              password: model.password ?? '',
            ),
          )
          .toList();
      return Right(userData);
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}
