import 'package:dio/dio.dart';
import 'package:split_bill/core/http_client/interceptor/auth_interceptor.dart';

final dioClient = Dio(
  BaseOptions(
    connectTimeout: Duration(milliseconds: 10000),
    receiveTimeout: Duration(milliseconds: 30000),
  ),
)..interceptors.addAll([
    AuthInterceptor(),
  ]);
