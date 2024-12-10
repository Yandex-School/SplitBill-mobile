import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:split_bill/core/http_client/interceptor/auth_interceptor.dart';
import 'package:split_bill/core/local_data/shared_preferences.dart';
import 'package:split_bill/core/router/app_router.dart';
import 'package:split_bill/features/event_room/data/datasources/event_room_remote_datasource.dart';
import 'package:split_bill/features/event_room/data/repositories/event_room_repository_impl.dart';
import 'package:split_bill/features/event_room/domain/repository/event_room_repository.dart';
import 'package:split_bill/features/event_room/presentation/provider/event_room_provider.dart';
import 'package:split_bill/features/login/data/auth_datasource.dart';
import 'package:split_bill/features/login/data/login_data_source.dart';
import 'package:split_bill/features/login/domain/login_repository.dart';
import 'package:split_bill/features/login/presentation/provider/login_provider.dart';
import 'package:split_bill/features/product_room/presentation/provider/room_products_provider.dart';
import 'package:split_bill/features/room/data/datasources/room_remote_datasource.dart';
import 'package:split_bill/features/room/data/repository/room_repository_impl.dart';
import 'package:split_bill/features/room/domain/repository/room_repository.dart';
import 'package:split_bill/features/room/presentation/provider/room_provider.dart';

part "event_room_di.dart";

GetIt get getIt => GetIt.instance;

Future<void> setupDependencies() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(milliseconds: 10000),
      receiveTimeout: const Duration(milliseconds: 30000),
    ),
  )..interceptors.addAll(
      [
        AuthInterceptor(),
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
        ),
      ],
    );

  getIt.registerLazySingleton(() => dio);
  getIt.registerSingleton(SharedPrefsService(sharedPreferences));

  getIt.registerLazySingleton<AuthorizationRepository>(
    () => LoginRepositoryImpl(
      authApi: AuthorizationApi(dio),
    ),
  );
  _initEventRoom();
  getIt.registerSingleton(AppRouter(getIt<SharedPrefsService>()));
  getIt.registerSingleton(LoginProvider());
}
