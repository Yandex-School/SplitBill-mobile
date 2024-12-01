import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/exeptions.dart';
import 'package:split_bill/core/errors/failures.dart';
import 'package:split_bill/core/http_client/apis/auth_api.dart';
import 'package:split_bill/core/http_client/http_client.dart';
import 'package:split_bill/core/usecase/usecase.dart';
import 'package:split_bill/features/login/data/models/register_request_model.dart';
import 'package:split_bill/features/login/data/models/register_response.dart';

class RegisterUseCase extends UseCase<RegisterResponse?, RegisterRequest> {
  final authApi = AuthApi(dioClient);

  @override
  Future<Either<Failure, RegisterResponse?>> call(RegisterRequest params) async {
    try {
      final response = await authApi.register(registerRequest: params);
      return right(response);
    } on ServerExeption catch (e) {
      return left(const ServerFailure());
    }
  }
}
