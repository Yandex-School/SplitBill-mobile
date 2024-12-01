import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/exeptions.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/http_client/apis/auth_api.dart';
import 'package:split_bill/core/http_client/http_client.dart';
import 'package:split_bill/core/usecase/usecase.dart';
import 'package:split_bill/features/login/data/models/login_request.dart';
import 'package:split_bill/features/login/data/models/login_response.dart';

class LoginUseCase extends UseCase<LoginResponse?, LoginRequest> {
  final authApi = AuthApi(dioClient);

  @override
  Future<Either<Failure, LoginResponse?>> call(LoginRequest params) async {
    try {
      final response = await authApi.login(loginRequest: params);
      return right(response);
    } on ServerExeption catch (e) {
      return left(const ServerFailure());
    }
  }
}
