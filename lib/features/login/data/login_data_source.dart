import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/features/login/data/models/login_request.dart';
import 'package:split_bill/features/login/data/models/login_response.dart';
import 'package:split_bill/features/login/data/usecases/login_data_source_usecase.dart';

abstract interface class LoginDataSource {
  Future<Either<Failure, LoginResponse?>?> login(LoginRequest loginRequest);
}

class LoginDataRepository implements LoginDataSource {
  final loginUseCase = LoginUseCase();

  @override
  Future<Either<Failure, LoginResponse?>?> login(LoginRequest loginRequest) async {
    return await loginUseCase(loginRequest);
  }
}
