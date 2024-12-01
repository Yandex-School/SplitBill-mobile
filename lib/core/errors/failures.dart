// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
}

//for server failure status code is 502
class ServerFailure extends Failure {
  const ServerFailure();
  @override
  List<Object?> get props => [];
}

//for not found failure status code is 404

class NotFoundFailure extends Failure {
  const NotFoundFailure();
  @override
  List<Object?> get props => [];
}

//for cache failure from device disk
class CasheFailure extends Failure {
  const CasheFailure();

  @override
  List<Object?> get props => [];
}

//for connection failure
class ConnectionFailure extends Failure {
  const ConnectionFailure();
  @override
  List<Object?> get props => [];
}

//for error from choosing picture
class ChoosePictureFailure extends Failure {
  const ChoosePictureFailure();

  @override
  List<Object?> get props => [];
}

//for otp failure 403
class Otpfailure extends Failure {
  const Otpfailure();

  @override
  List<Object?> get props => [];
}

//for auth failure 401
class AuthorizationFailure extends Failure {
  const AuthorizationFailure();

  @override
  List<Object?> get props => [];
}

//for uknown failure
class UnknownFailure extends Failure {
  const UnknownFailure();

  @override
  List<Object?> get props => [];
}

//for inital state
class InitFailure extends Failure {
  const InitFailure();

  @override
  List<Object?> get props => [];
}

class RequiredFieldIsNull extends Failure {
  const RequiredFieldIsNull();

  @override
  List<Object?> get props => [];
}
