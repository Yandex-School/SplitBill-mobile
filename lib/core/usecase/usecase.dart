import 'package:dartz/dartz.dart';
import 'package:split_bill/core/errors/failures.dart';

///[Usecase] generic usecases with [<T,P>] generics params
///T -> for Type of incoming instances
///P -> for parameters of methods
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// [NoParams] should use when is no anything to path to method params
class NoParams {}
